json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :place_id, :cuisine, :price
  json.url restaurant_url(restaurant, format: :json)
end
