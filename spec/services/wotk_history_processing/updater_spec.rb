require 'rails_helper'

RSpec.describe WorkHistoryProcessing::Updater do
  let(:my_work_history) { create(:work_history) }

  describe 'create action' do
    let(:valid_params) do
      {
        title: 'RoR developer'
      }
    end

    it 'Is successful' do
      described_class.update!(valid_params, my_work_history.id)
      expect(WorkHistory.first.title).to eq valid_params[:title]
    end
  end
end
