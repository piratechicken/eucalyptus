class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    return nil if country.nil?
    "#{suburb}, #{state}, #{country}"
  end

end
