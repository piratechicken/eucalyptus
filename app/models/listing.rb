class Listing < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  belongs_to :specie
  has_one :charge

  validates :title, presence: true
  validates :specie, presence: true
  validates :price_cents, presence: true
  validates :description, presence: true

  # Get unsold and sold listings
  scope :active, -> {
    where(active: true)
  }
  scope :inactive, -> {
    where(active: false)
  }

end
