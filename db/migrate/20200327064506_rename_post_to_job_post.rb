# frozen_string_literal: true

# Rename table
class RenamePostToJobPost < ActiveRecord::Migration[6.0]
  def change
    rename_table :posts, :job_posts
  end
end
