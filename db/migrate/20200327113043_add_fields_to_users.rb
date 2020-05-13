# frozen_string_literal: true

# Add fields to User Devise
class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile, :bigint
    add_column :users, :gender, :integer
    add_column :users, :last_seen_at, :datetime
  end
end
