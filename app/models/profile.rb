class Profile < ApplicationRecord
  belongs_to :user

  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_address
    return nil if country.nil?
    "#{suburb}, #{state}, #{country}"
  end

end
