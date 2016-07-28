json.array!(@students) do |student|
  json.extract! student, :id, :name, :standard_id, :section_id, :school_id
  json.url student_url(student, format: :json)
end
