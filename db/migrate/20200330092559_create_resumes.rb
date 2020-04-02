# frozen_string_literal: true

# Resume table
class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :file_name
      t.references :user

      t.timestamps
    end
  end
end
