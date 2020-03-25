# frozen_string_literal: true

class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :resume_file
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
