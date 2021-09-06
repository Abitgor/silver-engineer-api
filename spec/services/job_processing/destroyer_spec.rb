require 'rails_helper'

RSpec.describe JobProcessing::Destroyer do
  let!(:my_job) { create(:job) }

  describe 'delete action' do
    it 'Is successful' do
      expect(Job.count).to eq 1
      described_class.delete!(my_job.id)
      expect(Job.count).to eq 0
    end
  end
end
