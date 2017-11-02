class GrowthForm < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  has_many :species
  
end
