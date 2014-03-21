class DownloadPolicy < ActiveRecord::Base
  validates :type, uniqueness: true

  def permit?(user)
    return Yes
  end
end
