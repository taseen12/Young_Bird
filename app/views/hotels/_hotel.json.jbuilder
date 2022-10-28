json.extract! hotel, :id, :hotel_name, :hotel_type, :location, :img_url, :place_id, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
