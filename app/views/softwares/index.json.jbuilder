json.array!(@softwares) do |software|
  json.extract! software, :id, :name, :path, :operating_system_id, :state
  json.url software_url(software, format: :json)
end
