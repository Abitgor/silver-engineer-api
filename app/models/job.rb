# == Schema Information
#
# Table name: jobs
#
#  id          :bigint           not null, primary key
#  description :text
#  price       :integer
#  status      :integer
#  title       :string
#  type        :string
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
class Job < ApplicationRecord
  belongs_to :customer

  enum status: { published: 0, unpublished: 1, not_set: 2 }
end
