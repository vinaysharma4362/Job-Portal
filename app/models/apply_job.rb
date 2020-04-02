# frozen_string_literal: true

# Apply job
class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job_post

  validates_uniqueness_of :job_post_id, scope: :user_id
end
