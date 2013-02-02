class TenantUser < ActiveRecord::Base
  belongs_to :tenant_user
  
  attr_accessible :email, :first_name, :last_name, :tenant_id, :user_id
end
