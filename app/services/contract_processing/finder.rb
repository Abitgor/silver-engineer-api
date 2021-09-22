class ContractProcessing::Finder < ServiceBase
  attr_reader :contract_params

  def self.find_by(contract_params)
    new(contract_params).find_contract
  end

  def initialize(contract_params)
    super()

    @contract_params = contract_params
  end

  def find_contract
    contract = Contract.find_by(@contract_params)
    raise ActiveRecord::RecordNotFound unless contract.presence

    contract
  end
end
