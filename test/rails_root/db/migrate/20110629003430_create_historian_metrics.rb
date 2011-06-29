class CreateHistorianMetrics < ActiveRecord::Migration
  def self.up
    create_table :historian_metrics do |t|
      t.integer :historian_record_id
      t.string  :name
      t.string  :title
      t.string  :format
      t.string  :value
      t.timestamps
    end
    
    add_index :historian_metrics, :historian_record_id
  end

  def self.down
    drop_table :historian_metrics
  end
end