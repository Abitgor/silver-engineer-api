require 'rails_helper'

RSpec.describe ContractProcessing::Destroyer do
  let!(:my_contract) { create(:contract) }

  describe 'delete action' do
    it 'Is successful' do
      expect(Contract.count).to eq 1
      described_class.delete!(my_contract.id)
      expect(Contract.count).to eq 0
    end
  end
end
