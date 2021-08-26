module JobProcessing
  class Creator < ServiceBase
    attr_reader :job_params, :customer

    def self.create!(job_params, customer)
      new(job_params, customer).create_job
    end

    def initialize(job_params, customer)
      super()

      @job_params = job_params
      @customer = customer
    end

    def create_job
      @customer.jobs.create!(@job_params)
    end
  end
end
