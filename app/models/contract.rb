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
class Contract < ApplicationRecord
  belongs_to :customer, foreign_key: 'author_id'
  belongs_to :freelancer, foreign_key: 'signer_id'
  belongs_to :job
  has_one :work_history
  enum status: { active: 0, closed: 1 }
end
