class Software < ActiveRecord::Base
  belongs_to :operating_system
  belongs_to :download_policy

  validates :name, :path, :state, :operating_system, presence: true

  after_initialize :defaults, unless: :persisted?
  before_create :set_default_download_policy

  private
  def defaults
    self.state = :ready
  end

  def set_default_download_policy
    self.download_policy = self.download_policy or DownloadPolicy.first
  end
end
