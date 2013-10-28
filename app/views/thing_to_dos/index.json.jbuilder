json.array!(@thing_to_dos) do |thing_to_do|
  json.extract! thing_to_do, :place_id, :age_range
  json.url thing_to_do_url(thing_to_do, format: :json)
end
