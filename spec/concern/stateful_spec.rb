require 'spec_helper'

shared_examples 'stateful' do
  it 'should create the scope for every state possible' do
    described_class::STATE.each do |state|
      expect(described_class.send(state).where_values_hash).to eq({"state" => state})
    end
    end

  it 'should create query methods' do
    model = described_class.new(state: described_class::STATE.last)
    described_class::STATE.each do |state|
      expect(model.send("#{state}?")).to be(state==model.state)
    end
  end
end