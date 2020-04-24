# frozen_string_literal: true

# Companies fields added
class AddFieldsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :title, :string
    add_column :companies, :about, :text
    add_column :companies, :address, :string
    add_column :companies, :city, :string
    add_column :companies, :state, :string
    add_column :companies, :country, :string
    add_column :companies, :pincode, :bigint
    add_column :companies, :contact_no, :bigint
    add_column :companies, :website, :string
    add_column :companies, :status, :integer, default: 0
    add_column :companies, :facebook, :string
    add_column :companies, :instagram, :string
    add_column :companies, :linkedin, :string
  end
end
