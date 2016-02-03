json.array!(@scholarships) do |scholarship|
  json.extract! scholarship, :id, :name, :university_id, :start_date,
                :end_date, :description, :requirements, :benefits_offered, :url
  json.url scholarship_url(scholarship, format: :json)
end
