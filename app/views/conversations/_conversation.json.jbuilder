json.extract! conversation, :id, :seller_id, :buyer_id, :listing_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
