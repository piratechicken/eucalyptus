class Listing < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  belongs_to :user
  has_one :specie
end
