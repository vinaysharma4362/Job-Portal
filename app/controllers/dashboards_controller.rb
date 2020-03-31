# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  def index
    @job_posts = JobPost.order('created_at desc')
  end

  def job_post_apply
    @job_posts = JobPost.all
  end
end
