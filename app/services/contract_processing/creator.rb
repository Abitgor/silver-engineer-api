class ContractProcessing::Creator < ServiceBase
  attr_reader :contract_params, :author

  def self.create!(contract_params, author)
    new(contract_params, author).create_contract
  end

  def initialize(contract_params, author)
    super()
    @author = author
    @contract_params = contract_params
  end

  def create_contract
    Contract.transaction do
      @contract = @author.contracts.create!(@contract_params)
      create_work_history
    end
    Contract.find_by(@contract_params)
  end

  private

  def create_work_history
    WorkHistoryProcessing::Creator.create!(work_history_params)
  end

  def work_history_params
    job = JobProcessing::Finder.find_by(id: @contract_params[:job_id])
    {
      description: job.description,
      hours: 0,
      job_type: job.job_type,
      start_date: Time.zone.today,
      author_id: @author.id,
      signer_id: @contract_params[:signer_id],
      contract_id: @contract.id
    }
  end
end
