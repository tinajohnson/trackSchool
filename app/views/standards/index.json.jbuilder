json.array!(@standards) do |standard|
  json.extract! standard, :id, :standard_name, :string
  json.url standard_url(standard, format: :json)
end
