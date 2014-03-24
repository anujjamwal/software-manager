class Allocation < ActiveRecord::Base
  belongs_to :license
  belongs_to :user

  validates :license, :user, presence: true
  validate :license_availability

  def license_availability
    errors.add(:license, 'unavailable for allocation') unless self.license.available? if self.license
  end
end
