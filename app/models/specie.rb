class Specie < ApplicationRecord
  include ImageUploader::Attachment.new(:image)  

  belongs_to :growth_form
  has_many :listings
end
