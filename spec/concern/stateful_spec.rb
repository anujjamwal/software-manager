require 'spec_helper'

shared_examples 'stateful' do
  it 'should create the scope for every state possible' do
    described_class::STATE.each do |state|
      expect(described_class.send(state).where_values_hash).to eq({"state" => state})
    end
  end
end