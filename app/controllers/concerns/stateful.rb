module Stateful
  extend ActiveSupport::Concern

  included do
    self.const_get(:STATE).each do |state|
      scope state, -> {where(state: state)}
    end
  end
end