class User < ActiveRecord::Base
  has_many :allocations
  has_many :licenses, through: :allocations
end
