class Api::V1::ContractsController < Api::V1::ApplicationController
  def show
    contract = ContractProcessing::Finder.find_by(id: params[:id])
    render json: contract
  end

  def create
    contract = ContractProcessing::Creator.create!(contract_permitted_params, current_user)
    render json: contract
  end

  def update
    contract = ContractProcessing::Updater.update!(contract_permitted_params, params[:id])
    render json: contract
  end

  def destroy
    ContractProcessing::Destroyer.delete!(params[:id])
    render json: { id: params[:id], message: 'Successfully delete' }
  end

  private

  def contract_permitted_params
    params.require(:contract).permit(:hours, :rate, :status, :signer_id).merge(job_id: params[:job_id])
  end
end
