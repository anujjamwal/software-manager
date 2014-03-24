require 'spec_helper'

describe License do
  it {should have_many :allocations}
  it {should have_many(:users).through :allocations}
  it {belong_to :software}

  it 'should return the allocation count for a license' do
    license = FactoryGirl.create(:license)
    FactoryGirl.create(:allocation, license: license)
    FactoryGirl.create(:allocation, license: license)
    FactoryGirl.create(:allocation, license: license)

    expect(license.used_count).to be(3)
  end

  it 'should return the true if license if available for allocation' do
    license = FactoryGirl.create(:license, user_count: 5)
    FactoryGirl.create(:allocation, license: license)
    FactoryGirl.create(:allocation, license: license)
    FactoryGirl.create(:allocation, license: license)

    expect(license).to be_available
  end
end
