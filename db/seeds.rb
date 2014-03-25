# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


{
  'UserRole' => { softwares: [:index, :show, :download] },
  'AdminRole' => { softwares: [:all], licenses: [:all], operating_systems: [:all], allocations: [:all], users: [:all] }
}.each do |name, permissions|
  role = Role.where(name: name).first_or_create
  role.update(permissions: permissions)
end

admin_role = Role.last
[
    DownloadPolicy,
    LicensedDownloadPolicy
].each do |klass|
  klass.create
end

User.create(name: 'Anuj Jamwal', email: 'anujjam@thoughtworks.com', uid: 'anujjam', role: admin_role)
User.create(name: 'Sync User', email: 'syncuser@thoughtworks.com', uid: '', role: admin_role)
