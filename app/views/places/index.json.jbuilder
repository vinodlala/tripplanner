json.array!(@places) do |place|
  json.extract! place, :name, :address, :city, :state, :phone, :lat, :lon
  json.url place_url(place, format: :json)
end
