class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :suburb, presence: true
  validates :state, presence: true
  validates :country, presence: true

  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    return nil if country.nil?
    "#{suburb}, #{state}, #{country}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
