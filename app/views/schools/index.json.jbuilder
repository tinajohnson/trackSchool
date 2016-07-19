json.array!(@schools) do |school|
  json.extract! school, :id, :school_name, :string, :school_location, :school_contact, :school_admin
  json.url school_url(school, format: :json)
end
