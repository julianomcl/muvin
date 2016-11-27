json.extract! searched_location, :id, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url searched_location_url(searched_location, format: :json)