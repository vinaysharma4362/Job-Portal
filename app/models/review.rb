# frozen_string_literal: true

# Review model
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  self.per_page = 10
end
