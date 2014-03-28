class User < ActiveRecord::Base
  has_many :requests
  has_many :allocations
  has_many :licenses, through: :allocations
  belongs_to :role

  validates :uid, uniqueness: true, presence: true
  validates :role, presence: true

  scope :search, ->(key){ where('LOWER(name) like ? or LOWER(uid) like ?', "%#{key.downcase}%", "%#{key.downcase}%") }

  def self.ensure(auth)
    user = User.where(uid: auth['uid']).first_or_create(role: Role.first)
    user
  end

  delegate :can?, to: :role
end
