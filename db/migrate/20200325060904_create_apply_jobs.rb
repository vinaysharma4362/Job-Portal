# frozen_string_literal: true

# Applyjobs table
class CreateApplyJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :apply_jobs do |t|
      t.integer :status
      t.references :user, foreign_key: true
      t.references :job_post, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
