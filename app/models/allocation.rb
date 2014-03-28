class Allocation < ActiveRecord::Base
  STATE = [:active, :inactive]
  include Stateful

  belongs_to :license
  belongs_to :user

  validates :license, :user, presence: true
  validate :license_availability

  def license_availability
    errors.add(:license, 'unavailable for allocation') unless self.license.available? if self.license
  end

  def self.build(request, license)
    instance = new
    instance.update(license: license, user: request.user, project_code: request.project_code, state: :active)
    instance
  end
end
