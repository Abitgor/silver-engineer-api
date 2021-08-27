class JobProcessing::Finder < ServiceBase
  attr_reader :job_params

  def self.find_by(job_params)
    new(job_params).find_job
  end

  def initialize(job_params)
    super()

    @job_params = job_params
  end

  def find_job
    Job.find_by(@job_params)
  end
end
