json.array!(@licenses) do |license|
  json.extract! license, :id, :software_id, :license_user, :license, :user_count, :purchase_date, :cost, :used_count
  json.url license_url(license, format: :json)
end
