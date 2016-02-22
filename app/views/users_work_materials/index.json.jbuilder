json.array!(@users_work_materials) do |users_work_material|
  json.extract! users_work_material, :id
  json.url users_work_material_url(users_work_material, format: :json)
end
