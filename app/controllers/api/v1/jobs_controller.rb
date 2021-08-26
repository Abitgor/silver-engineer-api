class Api::V1::JobsController < Api::V1::ApplicationController
  def index
    Job.all
  end

  def show
    JobProcessing::Finder.find_by(id: params[:id])
  end

  def create
    JobProcessing::Creator.create!(job_permitted_params, current_user)
  end

  def update
    JobProcessing::Updater.update!(job_permitted_params, params[:id])
  end

  def destroy
    JobProcessing::Destroyer.delete!(params[:id])
  end

  private

  def job_permitted_params
    params.require(:job).permit(:title, :description, :status, :type, :price)
  end
end
