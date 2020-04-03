# frozen_string_literal: true

# Job post model
class JobPost < ApplicationRecord
  belongs_to :company
  has_many :comments
  has_many :apply_job, dependent: :destroy
  has_many :users, through: :apply_job

  validates :job_title, presence: true


  JOB_TYPE = %w[Part-time Full-time Infulencer].freeze
  STATUS = %w[Enable Disable].freeze
end
