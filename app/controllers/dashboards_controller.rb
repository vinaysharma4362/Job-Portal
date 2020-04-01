# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  def index
    @count = JobPost.all.count
    @job_posts = JobPost.order('created_at desc').limit(10)
  end

  def job_post_apply
    @job_posts = JobPost.all
  end
end
