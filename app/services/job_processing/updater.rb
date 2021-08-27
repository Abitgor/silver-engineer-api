class JobProcessing::Updater < ServiceBase
  attr_reader :job_params, :job_id

  def self.update!(job_params, job_id)
    new(job_params, job_id).update_job
  end

  def initialize(job_params, job_id)
    super()

    @job_params = job_params
    @job = JobProcessing::Finder.find_by(id: job_id)
  end

  def update_job
    @job.update!(@job_params) if @job.present?
  end
end
