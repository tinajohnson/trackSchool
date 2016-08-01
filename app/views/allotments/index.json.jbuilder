json.array!(@allotments) do |allotment|
  json.extract! allotment, :id, :user_id, :role, :school_id, :class_mappings_id
  json.url allotment_url(allotment, format: :json)
end
