class User < ActiveRecord::Base
  has_many :allocations
  has_many :licenses, through: :allocations

  validates :uid, uniqueness: true, presence: true

  def self.ensure(auth)
    user = User.where(uid: auth['uid']).first_or_create
    user
  end
end
