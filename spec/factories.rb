FactoryGirl.define do
  factory :operating_system do
    name 'Windows'
  end

  factory :download_policy do

  end

  factory :licensed_download_policy do

  end

  factory :software do
    name 'MS Office'
    path '/home/path/office'
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

  factory :user do
    name 'Clark Kent'
    email 'clark.kent@avengers.com'
    uid
    role {UserRole.last}
  end

  factory :allocation do
    user
    license
    project_code 'MCK15363'
  end
end