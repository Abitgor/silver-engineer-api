require 'rails_helper'

RSpec.describe WorkHistoryProcessing::Finder do
  let(:my_work_history) { create(:work_history) }

  describe 'find action' do
    let(:valid_params) do
      {
        id: my_work_history.id
      }
    end

    it 'Is successful' do
      result = described_class.find_by(valid_params)
      expect(result).to eq my_work_history
    end
  end
end
