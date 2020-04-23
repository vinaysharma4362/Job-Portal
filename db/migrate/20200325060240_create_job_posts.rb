# frozen_string_literal: true

class CreateJobPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :job_posts do |t|
      t.string :job_title
      t.string :description
      t.string :job_type
      t.string :location
      t.string :required_skill
      t.string :extra_skill
      t.bigint :salary_min
      t.bigint :salary_max
      t.date :last_apply_date
      t.string :language
      t.string :job_field
      t.integer :vacancy
      t.integer :status
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
