class DownloadPolicy < ActiveRecord::Base
  validates :type, uniqueness: true

  def permit?(software, user)
    true
  end
end
