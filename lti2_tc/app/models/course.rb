class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :links
  has_many :grade_items
  has_many :grade_results
  
  attr_accessible :course_label, :course_title
  alias_attribute :name, :course_label 
  
  def course_resolver(fieldname)
    case fieldname
    when "label"
      self.course_label
    when "title"
      self.course_title
    end
  end
  
end