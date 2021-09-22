require 'rails_helper'

RSpec.describe ContractProcessing::Finder do
  let(:my_contract) { create(:contract) }

  describe 'find action' do
    let(:valid_params) do
      {
        id: my_contract.id
      }
    end

    it 'Is successful' do
      result = described_class.find_by(valid_params)
      expect(result).to eq my_contract
    end
  end
end
