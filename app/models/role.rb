class Role < ActiveRecord::Base
  validates :type, uniqueness: true

  PERMISSIONS = []

  def can?(action)
    PERMISSIONS == :all || PERMISSIONS.include?(action)
  end

  def name
    self.class.name
  end
end
