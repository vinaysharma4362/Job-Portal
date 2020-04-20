# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  def index
    if current_user
      redirect_to admins_index_path if current_user.has_role? :admin
    end
    @count = JobPost.where(status: :active).count
    @job_posts = JobPost.order('created_at desc').limit(10)
  end

  def user_job_post
    @job_posts = JobPost.all
  end

  def company_list
    @companies = Company.all
  end
end
