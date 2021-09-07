class WorkHistoryProcessing::Creator < ServiceBase
  attr_reader :work_history_params

  def self.create!(work_history_params)
    new(work_history_params).work_history
  end

  def initialize(work_history_params)
    super()
    @work_history_params = work_history_params
  end

  def work_history
    WorkHistory.create!(@work_history_params)
  end
end
