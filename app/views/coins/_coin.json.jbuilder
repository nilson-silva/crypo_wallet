json.extract! coin, :id, :decription, :acronym, :url_image, :created_at, :updated_at
json.url coin_url(coin, format: :json)
