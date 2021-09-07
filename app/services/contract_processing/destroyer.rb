class ContractProcessing::Destroyer < ServiceBase
  attr_reader :contract_id

  def self.delete!(contract_id)
    new(contract_id).delete_contract
  end

  def initialize(contract_id)
    super()

    @contract = ContractProcessing::Finder.find_by(id: contract_id)
  end

  def delete_contract
    @contract.delete
  end
end
