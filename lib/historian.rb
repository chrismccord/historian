require "historian/version"
require "historian/errors"
require "historian/configuration"


module Historian
  extend Configuration
  
  def self.categories
    # @categories ||= @@config.collect do |key, attributes|
    #      Category.new(:key => key, :title => attributes["title"], :records => attributes["records"])
    #    end
    HistorianCategory.all
  end
  
  def self.history_for(category_name)
    HistorianRecord.where("historian_category_id = ?", HistorianCategory.find_by_name(category_name).id).order('created_at DESC')    
  end

  def self.record(category_name, record_values)
    category = HistorianCategory.find_by_name(category_name)
    raise CategoryNotFound, "'#{category_name}' does not exist" if category.nil?
    new_record = HistorianRecord.new(:category => category)
    record_values.collect do |key, value|
      new_record.metrics << HistorianMetric.new(:name   => key.to_s,
                                                :value  => value.to_yaml)
    end

    new_record.save
  end
end
