class FilterFramework::FilterSet < ActiveRecord::Base
  set_table_name :filter_framework_filter_sets
  
  has_many :filter_groups, :class_name => "FilterFramework::FilterGroup"
  
  # TODO support passing in a array or hash of objects
  def matches?(obj, nil_ok = false)
    if obj == nil
      return true if nil_ok
      return false
    end
    
    applicable_groups = filter_groups.select{|fg| fg.filtered_class.constantize == obj.class}
    return true unless applicable_groups.size > 0
    applicable_groups.each do |fg|
      return false unless fg.matches?(obj)
    end
    return true
  end
end