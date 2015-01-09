json.array!(@setrecords) do |setrecord|
  json.extract! setrecord, :id
  json.url setrecord_url(setrecord, format: :json)
end
