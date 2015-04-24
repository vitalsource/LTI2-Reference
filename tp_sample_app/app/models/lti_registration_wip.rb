class LtiRegistrationWip < ActiveRecord::Base
  def self.change_tenant_secret(tenant_id, new_secret)
    tenant = Tenant.find(tenant_id)
    tenant.secret = new_secret
    tenant.save
  end

  def self.get_tenant_credentials(tenant_id)
    tenant = Tenant.find(tenant_id)
    [tenant.tenant_key, tenant.secret]
  end

end
