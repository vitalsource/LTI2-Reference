class AdminUser < ActiveRecord::Base
  has_many :enrollments
  has_many :grade_results
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :first_name, :last_name, :email, :role, 
        :password, :password_confirmation, :remember_me
  alias_attribute :name, :user_id 
  
  # For variable subsitition
  def user_resolver(fieldname)
    case fieldname
    when "id"
      self.id
    when "username"
      self.email
    end
  end
  
  def person_resolver(fieldname)
    case fieldname
    when "name.family"
      self.last_name
    when "name.full"
      "#{self.first_name} #{self.last_name}"
    when "name.given"
      self.first_name
    when "email.primary"
      self.email
    when "sourcedId"
      self.user_id
    end
  end
end
