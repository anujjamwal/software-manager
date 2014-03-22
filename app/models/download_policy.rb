class DownloadPolicy < ActiveRecord::Base
  validates :type, uniqueness: true

  def permit?(software, user)
    true
  end

  def name
    self.class.name
  end
end
