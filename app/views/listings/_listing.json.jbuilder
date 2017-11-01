json.extract! listing, :id, :title, :species_id, :user_id, :description, :price_cents, :image_data, :created_at, :updated_at
json.url listing_url(listing, format: :json)
