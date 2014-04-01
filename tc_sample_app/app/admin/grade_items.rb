ActiveAdmin.register GradeItem do

  menu :parent => "LMS..."

  permit_params :course_id, :label

end
