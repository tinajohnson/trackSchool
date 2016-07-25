json.array!(@class_mappings) do |class_mapping|
  json.extract! class_mapping, :id
  json.url class_mapping_url(class_mapping, format: :json)
end
