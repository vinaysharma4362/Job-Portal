# frozen_string_literal: true

# Resume Model
class Resume < ApplicationRecord
  belongs_to :user
  has_one_attached :resume_file
end
