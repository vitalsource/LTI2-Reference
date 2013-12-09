class Iresource < ActiveRecord::Base
  belongs_to :tenant
  
  attr_accessible :tenant_id, :result_uri, :userid, :contextid, :score
end
