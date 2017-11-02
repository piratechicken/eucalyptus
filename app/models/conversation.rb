class Conversation < ApplicationRecord
  belongs_to :listing
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  has_many :messages
end
