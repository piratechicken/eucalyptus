class ProfilePolicy < ApplicationPolicy
  
  def update?
    user.profile == record
  end
  # In application_policy edit will do the same as update

end