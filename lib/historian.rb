require "historian/version"
require "historian/errors"
require "historian/configuration"
require 'historian/engine' if defined?(Rails)

module Historian
  extend Configuration
  
  def self.categories
    HistorianCategory.all
  end
  
  def self.history_for(category_name)
    cat_id = HistorianCategory.find_by_name(category_name).id rescue nil
    HistorianRecord.where("historian_category_id = ?", cat_id).order('created_at DESC') if cat_id
  end

  # Record values for given category name.
  # Autocreates new category with inferred titles from hash keys if category does not exist
  # and Historian.auto_create is true, raises not found error otherwise
  #
  def self.record(category_name, params = {})
    record_values = params[:data] || raise(ArgumentError, 'Historian record must include :data')
    created_at    = params[:at] || Time.now
    
    category = HistorianCategory.find_by_name(category_name)
    if category.nil? && Historian.auto_create
      category = HistorianCategory.create(:name => category_name.to_s,
                                          :title => category_name.to_s.humanize,
                                          :metric_keys => record_values.collect{|key, value| key.to_s },
                                          :metric_titles => record_values.collect{|key, value| key.to_s.humanize })
    end
    raise CategoryNotFound, "'#{category_name}' does not exist" if category.nil?
    new_record = HistorianRecord.new(:category => category)
    record_values.collect do |key, value|
      new_record.metrics << HistorianMetric.new(:name   => key.to_s,
                                                :value  => value.to_yaml,
                                                :created_at => created_at)
      new_record.created_at = created_at
    end

    new_record.save
  end
end
