class Software < ActiveRecord::Base
  STATE = [:approved, :unapproved, :unavailable]
  DEFAULT_DOWNLOAD_POLICY = DownloadPolicy

  include Stateful
  include PgSearch

  pg_search_scope :search,
                  against: [:name],
                  using: {
                      tsearch: {
                          dictionary: 'english',
                          tsvector_column: 'tsvector_content_tsearch'
                      }
                  }


  belongs_to :operating_system
  belongs_to :download_policy
  has_many :licenses
  has_many :requests

  validates :name, :path, :state, :operating_system, :download_policy, presence: true
  validates :path, uniqueness: true

  after_initialize :defaults, unless: :persisted?
  before_create :set_default_download_policy

  private
  def defaults
    self.state = self.state || :approved
    self.download_count = 0
  end

  def set_default_download_policy
    self.download_policy = self.download_policy or DEFAULT_DOWNLOAD_POLICY.first
  end
end
