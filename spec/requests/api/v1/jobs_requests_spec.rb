require 'rails_helper'

RSpec.describe 'Job requests', type: :request do
  let!(:current_user) { create(:customer) }

  let!(:auth_header) { get_headers(current_user.email, current_user.password) }

  describe 'put #update' do
    let(:job) { create(:job, user_id: current_user.id) }
    let(:valid_params) do
      {
        title: 'RoR developer',
        status: :unpublished
      }
    end

    it 'response is successful' do
      put "/api/v1/jobs/#{job.id}", params: { job: valid_params }, headers: auth_header, as: :json
      expect(Job.find(job.id).title).to eq valid_params[:title]
    end
  end

  describe 'get #show' do
    let(:job) { create(:job, user_id: current_user.id) }

    it 'response is successful' do
      get "/api/v1/jobs/#{job.id}", headers: auth_header, as: :json
      expect(Job.find(job.id).title).to eq job.title
    end
  end

  describe 'post #create' do
    let(:valid_params) do
      {
        user: current_user,
        title: 'RoR developer',
        status: :unpublished
      }
    end

    it 'response is successful' do
      post '/api/v1/jobs', params: { job: valid_params }, headers: auth_header, as: :json
      expect(Job.count).to eq 1
    end
  end

  describe 'get #index' do
    before do
      create_list(:job, 5, user_id: current_user.id)
    end

    it 'response is successful' do
      get '/api/v1/jobs', headers: auth_header, as: :json
      expect(Job.count).to eq 5
    end
  end

  describe 'delete #destroy' do
    let(:job) { create(:job, user_id: current_user.id) }
    let(:valid_params) do
      {
        title: 'RoR developer',
        status: :unpublished
      }
    end

    it 'response is successful' do
      delete "/api/v1/jobs/#{job.id}", headers: auth_header, as: :json
      expect(response.status).to eq 204
    end
  end
end
