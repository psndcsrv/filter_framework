class CreateFilters < ActiveRecord::Migration
  def self.up
    create_table :filter_framework_filters, :force => true do |t|
      t.integer :filter_group_id
      t.text :attribute
      t.text :condition
      t.integer :operator
      t.timestamps
    end
    
    add_index :filter_framework_filters, :filter_group_id
  end

  def self.down
    remove_index :filter_framework_filters, :column_name
    drop_table :filter_framework_filters
  end
end
