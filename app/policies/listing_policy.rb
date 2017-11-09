class ListingPolicy < ApplicationPolicy
  
  def update?
    user == record.user
  end
  # In application_policy edit will do the same as update

end