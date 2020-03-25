# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :company
  has_many :comments, dependent: :destroy
  has_many :apply_job, dependent: :destroy
end
