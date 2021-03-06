require 'spec_helper'

describe Software do
  it { should validate_presence_of :name }
  it { should validate_presence_of :path }
  it { should validate_presence_of :state }
  it { should validate_presence_of :operating_system }
  it { should validate_presence_of :download_policy }
  it { should validate_uniqueness_of :path }

  it { should have_many :licenses }
  it { should have_many :requests }
  it { should belong_to :download_policy }
  it { should belong_to :operating_system }

  it_behaves_like 'stateful'
end