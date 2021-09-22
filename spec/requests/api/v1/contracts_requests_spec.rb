require 'rails_helper'

RSpec.describe 'Contract requests', type: :request do
  let!(:current_user) { create(:customer) }
  let!(:freelancer) { create(:freelancer) }
  let!(:job) { create(:job, customer: current_user) }
  let!(:auth_header) { get_headers(current_user.email, current_user.password) }

  describe 'put #update' do
    let(:contract) { create(:contract, job: job, customer: current_user, freelancer: freelancer) }
    let(:valid_params) do
      {
        hours: 20
      }
    end

    it 'response is successful' do
      put "/api/v1/jobs/#{job.id}/contracts/#{contract.id}",
          params: { contract: valid_params }, headers: auth_header, as: :json
      expect(Contract.find(contract.id).hours).to eq valid_params[:hours]
    end
  end

  describe 'get #show' do
    let(:contract) { create(:contract, job: job, customer: current_user, freelancer: freelancer) }

    it 'response is successful' do
      get "/api/v1/jobs/#{job.id}/contracts/#{contract.id}", headers: auth_header, as: :json
      expect(Contract.find(contract.id).hours).to eq contract.hours
    end
  end

  describe 'post #create' do
    let(:valid_params) do
      {
        signer_id: freelancer.id,
        status: :active,
        rate: 20,
        hours: 160
      }
    end

    it 'response is successful' do
      post "/api/v1/jobs/#{job.id}/contracts", params: { contract: valid_params }, headers: auth_header, as: :json
      expect(Contract.count).to eq 1
    end
  end

  describe 'delete #destroy' do
    let(:contract) { create(:contract, job: job, customer: current_user, freelancer: freelancer) }

    it 'response is successful' do
      delete "/api/v1/jobs/#{job.id}/contracts/#{contract.id}", headers: auth_header, as: :json
      expect(Contract.count).to eq 0
    end
  end
end
