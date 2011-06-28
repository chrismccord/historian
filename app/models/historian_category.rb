class HistorianCategory < ActiveRecord::Base

  has_many :records, :class_name => 'HistorianRecord'

  serialize :metric_keys, Array
  serialize :metric_titles, Array

  # Validations
  validates_presence_of :name
  validates_presence_of :title

  # Callbacks
  before_save :remove_empty_metrics
  
  def remove_empty_metrics
    self.metric_keys.delete_if{|key| key.blank? }
    self.metric_titles.delete_if{|title| title.blank? }
  end
  
  def metric_keys
    read_attribute(:metric_keys) || []
  end
  
  def metric_titles
    read_attribute(:metric_titles) || []
  end
end