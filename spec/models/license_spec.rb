require 'spec_helper'

describe License do
  it {should have_many :allocations}
  it {should have_many(:users).through :allocations}
  it {belong_to :software}
end
