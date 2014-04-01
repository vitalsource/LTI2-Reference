ActiveAdmin.register AdminUser do

  menu :parent => "Admin..."

  permit_params :user_id, :first_name, :last_name, :email, :role, :password

  index do
    column :user_id
    column :first_name
    column :last_name
    column :email
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :user_id
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :role, :as => :select, :collection => ["administrator", "instructor", "student"]
      f.input :password, :required => false
      f.input :password_confirmation, :required => false
    end
    f.actions
  end

end
