# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
    Role,
    AdminRole,
    UserRole,
    DownloadPolicy,
    LicensedDownloadPolicy
].each do |klass|
  klass.create
end

User.create(name: 'Anuj Jamwal', email: 'anujjam@thoughtworks.com', uid: 'anujjam', role: AdminRole.last)
User.create(name: 'Sync User', email: 'syncuser@thoughtworks.com', uid: '', role: AdminRole.last)