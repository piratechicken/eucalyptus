class Conversation < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'User'
  has_many :messages, dependent: :destroy

  scope :between, -> (buyer_id,listing_id) {
    where("(conversations.buyer_id = ? AND conversations.listing_id =?)", buyer_id, listing_id)
  }

  scope :user_conversations, -> (user) do 
    where(buyer: user).or(where(listing: Listing.where(user: user)))
  end

  def seller
    self.listing.user
  end

end
