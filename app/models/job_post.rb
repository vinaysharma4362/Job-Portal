# frozen_string_literal: true

class JobPost < ApplicationRecord
  belongs_to :company
  has_many :comments
  has_many :apply_job

  enum job_type: %i[Parttime Fulltime Infulencer]
  enum status: %i[Enable Disable]
end
