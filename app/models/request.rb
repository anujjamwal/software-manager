class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :software

  validates :user, :uniqueness => { :scope => :software }

  after_create :notify_request

  private
  def notify_request
    LicenseMailer.requested(self).deliver
  end
end
