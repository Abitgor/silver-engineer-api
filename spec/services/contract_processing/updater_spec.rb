require 'rails_helper'

RSpec.describe ContractProcessing::Updater do
  let(:my_contract) { create(:contract) }

  describe 'create action' do
    let(:valid_params) do
      {
        rate: 21
      }
    end

    it 'Is successful' do
      described_class.update!(valid_params, my_contract.id)
      expect(Contract.first.rate).to eq valid_params[:rate]
    end
  end
end
