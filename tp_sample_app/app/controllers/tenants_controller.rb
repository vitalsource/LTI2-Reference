class TenantsController < InheritedResources::Base

  def create
    if params.has_key? "tc_profile_url"
      # from outside world
      @tenant = Tenant.new
    end

    render :template => "tenants/edit"
  end

  def show
    @tenant = Tenant.find(request.parameters[:id])
    render :json => @tenant
  end

end
