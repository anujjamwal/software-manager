FactoryGirl.define do
  sequence :name do |n|
    "Role#{n}"
  end

  factory :operating_system do
    name
  end

  factory :download_policy do

  end

  factory :licensed_download_policy do

  end

  sequence :path do |n|
    "/path/sw-#{n}"
  end

  factory :software do
    name 'MS Office'
    path
    operating_system
    state 'available'
    download_policy {DownloadPolicy.first}
    download_count 0
  end

  factory :license do
    software
    license_user 'ThoughtWorks Inc'
    license 'iurbiurbvbeibviebvuiebribvbeivrebivbeivbreibvvrivbei'
    user_count 5
    purchase_date Date.parse('10 Jan, 2012')
    cost 2000
  end

  sequence :uid do |n|
    "user#{n}"
  end

  factory :role do
    name
    permissions Hash.new(name: [])
  end

  factory :user do
    name 'Clark Kent'
    email 'clark.kent@avengers.com'
    uid
    role
  end

  factory :allocation do
    user
    license
    project_code 'MCK15363'
  end

  factory :request do
    software
    user
    project_code 'MCK15363'
  end
end