class Enrollment < ActiveRecord::Base
    belongs_to :admin_user
    belongs_to :course
    
    attr_accessible :admin_user_id, :role, :course_id
    
    def to_s
      self.course.course_label
    end
end