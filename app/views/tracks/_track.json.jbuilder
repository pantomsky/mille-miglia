json.extract! track, :id, :origin_address, :dest_address, :distance, :created_at, :updated_at
json.url track_url(track, format: :json)