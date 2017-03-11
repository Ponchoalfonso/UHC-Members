json.extract! recent, :id, :title, :body, :author, :created_at, :updated_at
json.url recent_url(recent, format: :json)
