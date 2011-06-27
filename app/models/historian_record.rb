class HistorianRecord < ActiveRecord::Base
  belongs_to :category, :foreign_key => 'historian_category_id', :class_name => 'HistorianCategory'
  has_many :metrics, :class_name => 'HistorianMetric'

end