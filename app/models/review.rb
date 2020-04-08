# frozen_string_literal: true

# Review model
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :user_id,
            uniqueness:
             { scope: :company_id,
               message: 'Users may only write one review per Company.' }
end
