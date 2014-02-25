include Lti2Commons
include MessageSupport
include Signer

module Lti2Tc

  class Link < ActiveRecord::Base
    belongs_to :course
    belongs_to :resource
    has_many :tool_settings, :as => :scopeable

    attr_accessible :enrollment_id, :resource_link_label, :tool_id, :link_parameters, :grade_item_id

    def lti_launch(user, return_url)
      enrollment = Enrollment.where(:admin_user_id => @user.id, :course_id => @course.id).first
      Lti2Tc::Lti2Launch.new(user, self, self.resource, self.course, enrollment, return_url).launch()
    end

    def is_ready_for_use
      self.is_enabled and self.resource.tool.is_enabled
    end

  end
end