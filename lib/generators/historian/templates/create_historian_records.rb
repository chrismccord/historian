class CreateHistorianRecords < ActiveRecord::Migration
  def self.up
    create_table :historian_records do |t|
      t.integer  :historian_category_id
      t.text    :annotation
      t.timestamps
    end
    
    add_index :historian_records, :historian_category_id
    add_index :historian_records, :created_at
  end

  def self.down
    drop_table :historian_records
  end
end