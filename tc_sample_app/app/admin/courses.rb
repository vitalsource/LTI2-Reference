ActiveAdmin.register Course do

  permit_params :course_label, :course_title

  menu :parent => "LMS..."

end
