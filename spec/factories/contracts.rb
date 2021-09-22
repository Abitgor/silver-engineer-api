# == Schema Information
#
# Table name: contracts
#
#  id         :bigint           not null, primary key
#  hours      :integer          default(0)
#  rate       :integer          default(0)
#  status     :integer          default("active")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  job_id     :bigint           not null
#  signer_id  :bigint
#
# Indexes
#
#  index_contracts_on_author_id  (author_id)
#  index_contracts_on_job_id     (job_id)
#  index_contracts_on_signer_id  (signer_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id) ON DELETE => cascade
#  fk_rails_...  (job_id => jobs.id) ON DELETE => cascade
#  fk_rails_...  (signer_id => users.id) ON DELETE => cascade
#
FactoryBot.define do
  factory :contract do
    customer { create(:customer) }
    freelancer { create(:freelancer) }
    job { create(:job) }
    status { :active }
    rate { 20 }
    hours { 0 }
  end
end
