# == Schema Information
#
# Table name: work_histories
#
#  id          :bigint           not null, primary key
#  description :text
#  end_date    :datetime
#  hours       :integer
#  job_type    :string
#  price       :integer
#  rate        :integer
#  start_date  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  contract_id :bigint           not null
#  signer_id   :bigint
#
# Indexes
#
#  index_work_histories_on_author_id    (author_id)
#  index_work_histories_on_contract_id  (contract_id)
#  index_work_histories_on_signer_id    (signer_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id) ON DELETE => cascade
#  fk_rails_...  (contract_id => contracts.id) ON DELETE => cascade
#  fk_rails_...  (signer_id => users.id) ON DELETE => cascade
#
FactoryBot.define do
  factory :work_history do
    title { Faker::Job.title }
    description { Faker::Job.position }
    job_type { Faker::Job.employment_type }
    customer { create(:customer) }
    freelancer { create(:freelancer) }
    contract { create(:contract) }
    rate { 20 }
    hours { 0 }
  end
end
