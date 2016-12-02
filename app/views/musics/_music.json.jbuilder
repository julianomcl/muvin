json.extract! music, :id, :track_name, :artist_name, :location_id, :created_at, :updated_at
json.url music_url(music, format: :json)