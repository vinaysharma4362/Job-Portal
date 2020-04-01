# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  def index
    @count = JobPost.all.count
    @job_posts = JobPost.order('created_at desc').limit(10)
  end

  def user_job_post
    @job_posts = JobPost.all
  end
end

