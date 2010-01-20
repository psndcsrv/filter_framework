class CreateFilterGroups < ActiveRecord::Migration
  def self.up
    create_table :filter_framework_filter_groups, :force => true do |t|
      t.integer :filter_set_id
      t.text :filtered_class
      t.text :filter_rule
      t.timestamps
    end
    
    add_index :filter_framework_filter_groups, :filter_set_id
  end

  def self.down
    remove_index :filter_framework_filter_groups, :filter_set_id
    drop_table :filter_framework_filter_groups
  end
end
