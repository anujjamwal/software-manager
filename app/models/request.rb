class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :software

  validates :user, :uniqueness => { :scope => :software }
end
