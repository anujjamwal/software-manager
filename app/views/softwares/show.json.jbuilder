json.extract! @software, :id, :name, :path, :operating_system_id, :state, :created_at, :updated_at
json.download_url download_software_url(@software, format: :json)
