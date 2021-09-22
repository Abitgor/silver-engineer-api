class WorkHistoryProcessing::Finder < ServiceBase
  attr_reader :work_history_params

  def self.find_by(work_history_params)
    new(work_history_params).find_work_history
  end

  def initialize(work_history_params)
    super()

    @work_history_params = work_history_params
  end

  def find_work_history
    work_history = WorkHistory.find_by(@work_history_params)
    raise ActiveRecord::RecordNotFound unless work_history.presence

    work_history
  end
end
