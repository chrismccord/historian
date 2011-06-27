class CreateHistorianCategories < ActiveRecord::Migration
  def self.up
    create_table :historian_categories do |t|
      t.string :name
      t.string :title
      t.text :metric_config
      t.text   :annotation
      t.timestamps
    end
    
  end

  def self.down
    drop_table :historian_categories
  end
end