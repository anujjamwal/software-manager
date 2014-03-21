class Software < ActiveRecord::Base
  belongs_to :operating_system

  validates :name, :path, :state, :operating_system, presence: true

  after_initialize :defaults, unless: :persisted?

  private
  def defaults
    self.state = :ready
  end
end
