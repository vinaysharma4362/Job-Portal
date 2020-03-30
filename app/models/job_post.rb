# frozen_string_literal: true

class JobPost < ApplicationRecord
  belongs_to :company
  has_many :comments
  has_many :apply_job

  JOB_TYPE = %W[Part-time Full-time Infulencer]
  STATUS = %w[Enable Disable]
end
