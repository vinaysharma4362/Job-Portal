# frozen_string_literal: true

# Review table migration
class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.text :review_desc
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
