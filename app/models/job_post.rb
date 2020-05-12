# frozen_string_literal: true

# Job post model
class JobPost < ApplicationRecord
  has_rich_text :description
  has_rich_text :required_skill
  has_rich_text :extra_skill
  has_rich_text :language

  belongs_to :company
  has_many :comments
  has_many :apply_job, dependent: :destroy
  has_many :users, through: :apply_job

  validates :job_title, presence: true
  validates :description, presence: true
  validates :job_type, presence: true
  validates :salary_min, numericality: { greater_than: 0,
                                         less_than: :salary_max }
  validates :salary_max, numericality: { greater_than_or_equal_to: :salary_min,
                                         greater_than: 0 }

  JOB_TYPE = %w[Part-time Full-time Infulencer].freeze
  enum status: %i[inactive active]
end
