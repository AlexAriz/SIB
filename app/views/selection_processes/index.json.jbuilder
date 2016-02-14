json.array!(@selection_processes) do |selection_process|
  json.extract! selection_process, :id, :university_name, :deadline, :activities, :link
  json.url selection_process_url(selection_process, format: :json)
end
