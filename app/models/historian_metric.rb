class HistorianMetric < ActiveRecord::Base
  belongs_to :record, :foreign_key => 'historian_record_id', :class_name => 'HistorianRecord'
end