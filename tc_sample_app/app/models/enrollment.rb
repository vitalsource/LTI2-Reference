class Enrollment < ActiveRecord::Base

    belongs_to :admin_user
    belongs_to :course

    def to_s
      self.course.course_label
    end

end
