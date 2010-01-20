class FilterFramework::FilterSet < ActiveRecord::Base
  set_table_name :filter_framework_filter_sets
  
  has_many :filter_groups, :class_name => "FilterFramework::FilterGroup"
  
  # TODO support passing in a array or hash of objects
  def matches?(obj)
    filter_groups.each do |fg|
      return false unless fg.matches?(obj)
    end
    return true
  end
end