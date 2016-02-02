json.array!(@work_materials) do |work_material|
  json.extract! work_material, :id, :name, :description, :file_src, :tutor_id
  json.url work_material_url(work_material, format: :json)
end
