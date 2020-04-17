# frozen_string_literal: true

# Apply job
class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job_post

  STATUS = %i[not_reviewed interviewed reviewed joined rejected].freeze
  validates_uniqueness_of :job_post_id, scope: :user_id
end
