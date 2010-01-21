class FilterFramework::Filter < ActiveRecord::Base
  set_table_name :filter_framework_filters
  # text: attribute
  # text: condition
  # int: operator
  
  class Operator
    EQUAL_TO = EQ = 0
    GREATER_THAN = GT = 1  
    LESS_THAN = LT = 2
    GREATER_THAN_OR_EQUAL_TO = 3
    GTE = 3
    LESS_THAN_OR_EQUAL_TO = 4
    LTE = 4
    NOT_EQUAL = 5
    NE = 5
    
    TEXT = ["==", ">", "<", ">=", "<=", "!="]
    
    def self.text_value(op)
      if op < TEXT.size
        return TEXT[op]
      end
      return ""
    end
  end
  
  belongs_to :filter_group, :class_name => "FilterFramework::FilterGroup"
  def matches?(obj)
    return false if ! obj.respond_to? self.attribute
    # evals are pretty nasty, in general. Is there a better way to do this?
    return eval("obj.#{self.attribute} #{Operator.text_value(self.operator)} #{self.condition}")
  end
end