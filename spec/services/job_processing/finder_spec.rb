require 'rails_helper'

RSpec.describe JobProcessing::Finder do
  let(:my_job) { create(:job) }

  describe 'find action' do
    let(:valid_params) do
      {
        id: my_job.id
      }
    end

    it 'Is successful' do
      result = described_class.find_by(valid_params)
      expect(result).to eq my_job
    end
  end
end
