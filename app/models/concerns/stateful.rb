module Stateful
  extend ActiveSupport::Concern

  included do
    self.const_get(:STATE).each do |state|
      scope state, -> {where(state: state)}
    end

    class_eval do
      self.const_get(:STATE).each do |state|
        define_method "#{state}?" do
          self[:state].to_sym == state
        end
      end
    end
  end
end