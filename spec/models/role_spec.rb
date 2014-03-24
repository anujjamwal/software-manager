require 'spec_helper'

describe Role do
  it {should validate_uniqueness_of :type}
end
