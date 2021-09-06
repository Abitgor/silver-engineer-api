require 'rails_helper'

RSpec.describe JobProcessing::Creator do
  let(:current_customer) { create(:customer) }

  describe 'create action' do
    let(:valid_params) do
      {
        title: 'RoR developer',
        status: :unpublished
      }
    end

    it 'Is successful' do
      described_class.create!(valid_params, current_customer)
      expect(Job.count).to eq 1
    end
  end
end
