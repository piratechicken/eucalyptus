json.extract! profile, :id, :first_name, :last_name, :about, :image_data, :suburb, :state, :country, :latitude, :longitude, :created_at, :updated_at
json.url profile_url(profile, format: :json)
