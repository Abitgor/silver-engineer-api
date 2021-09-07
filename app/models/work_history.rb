# == Schema Information
#
# Table name: work_histories
#
#  id           :bigint           not null, primary key
#  description  :text
#  end_date     :datetime
#  hours        :integer
#  job_type     :string
#  price        :integer
#  rate         :integer
#  start_date   :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#  contracts_id :bigint           not null
#  signer_id    :bigint
#
# Indexes
#
#  index_work_histories_on_author_id     (author_id)
#  index_work_histories_on_contracts_id  (contracts_id)
#  index_work_histories_on_signer_id     (signer_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id) ON DELETE => cascade
#  fk_rails_...  (contracts_id => contracts.id) ON DELETE => cascade
#  fk_rails_...  (signer_id => users.id) ON DELETE => cascade
#
class WorkHistory < ApplicationRecord
  belongs_to :customer, foreign_key: 'author_id'
  belongs_to :freelancer, foreign_key: 'signer_id'
  belongs_to :contract

  def end_date
    end_date || 'present'
  end
end
