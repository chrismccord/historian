class HistorianCategory < ActiveRecord::Base
  has_many :records, :class_name => 'HistorianRecord'
  serialize :metric_config, Array

  def metric_symbols
    @metric_symbols = self.metric_config.collect{|metric| metric.downcase.gsub(" ", "_") }
  end
end