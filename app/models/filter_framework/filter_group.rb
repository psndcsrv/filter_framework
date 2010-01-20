class FilterFramework::FilterGroup < ActiveRecord::Base
  set_table_name :filter_framework_filter_groups
  # text: filter_rule  -- AND, OR
  # text: filtered_class
  
  belongs_to :filter_set, :class_name => "FilterFramework::FilterSet"
  has_many :filters, :class_name => "FilterFramework::Filter"
  
  def matches?(obj)
    return false if obj.class != self.filtered_class.constantize
    filters.each do |f|
      if filter_rule == "AND"
        return false unless f.matches?(obj)
      else
        return true if f.matches?(obj)
      end
    end
    if filter_rule == "AND"
      return true
    end
    return false
  end
end