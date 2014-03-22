json.array!(@allocations) do |allocation|
  json.extract! allocation, :id, :license_id, :user_id, :project_code
  json.url allocation_url(allocation, format: :json)
end
