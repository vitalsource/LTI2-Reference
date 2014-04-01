ActiveAdmin.register Enrollment do

  menu :parent => "LMS..."

  permit_params :admin_user_id, :role, :course_id

end
