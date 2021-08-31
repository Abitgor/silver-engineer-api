class Api::V1::JobsController < Api::V1::ApplicationController
  include Api::PerPage

  def index
    jobs = Job.page(params[:page]).per(per_page)
    render json: build_json(jobs)
  end

  def show
    job = JobProcessing::Finder.find_by(id: params[:id])
    render json: job
  end

  def create
    job = JobProcessing::Creator.create!(job_permitted_params, current_user)
    render json: job
  end

  def update
    job = JobProcessing::Updater.update!(job_permitted_params, params[:id])
    render json: job
  end

  def destroy
    JobProcessing::Destroyer.delete!(params[:id])
    render json: { id: params[:id], message: 'Successfully delete' }
  end

  private

  def job_permitted_params
    params.require(:job).permit(:title, :description, :status, :type, :price)
  end
end
