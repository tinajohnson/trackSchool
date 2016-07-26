json.array!(@schools) do |school|
  json.extract! school, :id, :name, :location, :contact, :admin
  json.url school_url(school, format: :json)
end
