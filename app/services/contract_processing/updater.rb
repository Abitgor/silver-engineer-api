class ContractProcessing::Updater < ServiceBase
  attr_reader :contract_params, :contract_id

  def self.update!(contract_params, contract_id)
    new(contract_params, contract_id).update_contract
  end

  def initialize(contract_params, contract_id)
    super()

    @contract_params = contract_params
    @contract = ContractProcessing::Finder.find_by(id: contract_id)
  end

  def update_contract
    Contract.transaction do
      @contract.update!(@contract_params)
      update_work_history
    end
  end

  private

  def update_work_history
    return unless (@contract_params[:status] == 1) || (@contract_params[:status] == 'closed')

    WorkHistoryProcessing::Updater.update!({ end_date: Time.zone.today }, @contract.work_history.id)
  end
end
