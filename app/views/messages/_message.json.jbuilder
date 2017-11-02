json.extract! message, :id, :user_id, :body, :read, :created_at, :updated_at
json.url message_url(message, format: :json)
