class WorkHistoryProcessing::Updater < ServiceBase
  attr_reader :work_history_params, :work_history_id

  def self.update!(work_history_params, work_history_id)
    new(work_history_params, work_history_id).update_work_history
  end

  def initialize(work_history_params, work_history_id)
    super()

    @work_history_params = work_history_params
    @work_history = WorkHistoryProcessing::Finder.find_by(id: work_history_id)
  end

  def update_work_history
    @work_history.update!(@work_history_params)
  end
end
