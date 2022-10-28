json.extract! room, :id, :room_no, :no_of_bed, :room_type, :room_description, :facilities, :price, :img_url, :place_id, :hotel_id, :created_at, :updated_at
json.url room_url(room, format: :json)
