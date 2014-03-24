class License < ActiveRecord::Base
  has_many :allocations
  has_many :users, through: :allocations
  belongs_to :software

  def good?
    true
  end

  def used_count
    self.allocations.count()
  end

  def available?
    self.used_count < self.user_count
  end
end
