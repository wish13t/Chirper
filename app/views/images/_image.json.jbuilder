json.extract! image, :id, :blog_id, :photo, :created_at, :updated_at
json.url image_url(image, format: :json)
