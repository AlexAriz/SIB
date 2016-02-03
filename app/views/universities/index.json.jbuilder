json.array!(@universities) do |university|
  json.extract! university, :id, :name, :city, :state,
                :country, :information, :url
  json.url university_url(university, format: :json)
end
