# == Schema Information
#
# Table name: jobs
#
#  id          :bigint           not null, primary key
#  description :text
#  job_type    :string
#  price       :integer
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_jobs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Job.position }
    job_type { Faker::Job.employment_type }
    customer { create(:customer) }
    status { :published }
  end
end
