class License < ActiveRecord::Base
  has_many :allocations
  has_many :users, through: :allocations
  belongs_to :software

  def good?
    true
  end
end
