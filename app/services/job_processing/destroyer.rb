class JobProcessing::Destroyer < ServiceBase
  attr_reader :job_id

  def self.delete!(job_id)
    new(job_id).delete_job
  end

  def initialize(job_id)
    super()

    @job = JobProcessing::Finder.find_by(id: job_id)
  end

  def delete_job
    @job.delete if @job.present?
  end
end
