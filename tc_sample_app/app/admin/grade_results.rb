ActiveAdmin.register GradeResult do

  menu :parent => "LMS..."

  permit_params :id, :link_id, :admin_user_id

end
