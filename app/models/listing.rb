class Listing < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  belongs_to :specie

  default_scope { where(active: true) }
end
