require 'rails_helper'

RSpec.describe JobProcessing::Updater do
  let(:my_job) { create(:job) }

  describe 'create action' do
    let(:valid_params) do
      {
        title: 'RoR developer',
        status: :unpublished
      }
    end

    it 'Is successful' do
      described_class.update!(valid_params, my_job.id)
      expect(Job.first.title).to eq valid_params[:title]
    end
  end
end
