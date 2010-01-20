class CreateFilterSets < ActiveRecord::Migration
  def self.up
    create_table :filter_framework_filter_sets, :force => true do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :filter_framework_filter_sets
  end
end
