require 'rails_helper'

RSpec.describe ContractProcessing::Creator do
  let(:current_customer) { create(:customer) }
  let(:my_job) { create(:job) }
  let(:freelancer) { create(:freelancer) }

  describe 'create action' do
    let(:valid_params) do
      {
        job_id: my_job.id,
        signer_id: freelancer.id,
        status: :active,
        rate: 0,
        hours: 0
      }
    end

    it 'Is successful' do
      described_class.create!(valid_params, current_customer)
      expect(Contract.count).to eq 1
    end
  end
end
