class Role < ActiveRecord::Base
  validates :name, uniqueness: true

  serialize :permissions

  def can?(controller, action)
    permissions = self.permissions.fetch(controller.to_sym, [])
    permissions.include?(:all) || permissions.include?(action.to_sym)
  end
end
