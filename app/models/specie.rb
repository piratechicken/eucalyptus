class Specie < ApplicationRecord
  include ImageUploader::Attachment.new(:image)  

  belongs_to :growth_form
  has_many :listings
  
  validates :name, presence: true
  validates :common_name, presence: true

end
