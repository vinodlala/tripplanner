json.array!(@hotels) do |hotel|
  json.extract! hotel, :place_id, :num_stars, :amenities
  json.url hotel_url(hotel, format: :json)
end
