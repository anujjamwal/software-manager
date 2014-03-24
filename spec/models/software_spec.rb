require 'spec_helper'

describe Software do
  it { should validate_presence_of :name }
  it { should validate_presence_of :path }
  it { should validate_presence_of :state }
  it { should validate_presence_of :operating_system }
  it { should validate_presence_of :operating_system }

  it { should have_many :licenses }
  it { should belong_to :download_policy }
  it { should belong_to :operating_system }

  it_behaves_like 'stateful'
end