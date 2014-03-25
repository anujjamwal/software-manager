class User < ActiveRecord::Base
  has_many :allocations
  has_many :licenses, through: :allocations
  belongs_to :role

  validates :uid, uniqueness: true, presence: true
  validates :role, presence: true

  def self.ensure(auth)
    user = User.where(uid: auth['uid']).first_or_create(role: Role.first)
    user
  end

end
