# frozen_string_literal: true

# Job post model
class JobPost < ApplicationRecord
  belongs_to :company
  has_many :comments
  has_many :apply_job, dependent: :destroy
  has_many :users, through: :apply_job

  validates :job_title, presence: true
  validates :salary_min, numericality: { greater_than: 0 }
  validates :salary_max, numericality: { greater_than: 0, greater_than: :salary_min }

  JOB_TYPE = %w[Part-time Full-time Infulencer].freeze
  enum status: %i[inactive active]
end
