json.array!(@requests) do |request|
  json.extract! request, :id, :software_id, :project_code, :user_id, :license_id
  json.url request_url(request, format: :json)
end
