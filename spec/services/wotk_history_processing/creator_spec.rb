require 'rails_helper'

RSpec.describe WorkHistoryProcessing::Creator do
  let(:customer) { create(:customer) }
  let(:freelancer) { create(:freelancer) }
  let(:contract) { create(:contract) }

  describe 'create action' do
    let(:valid_params) do
      {
        title: 'RoR developer',
        description: 'Best job ever',
        job_type: 'full-time',
        customer: customer,
        freelancer: freelancer,
        contract: contract,
        rate: 20,
        hours: 0
      }
    end

    it 'Is successful' do
      described_class.create!(valid_params)
      expect(WorkHistory.count).to eq 1
    end
  end
end
