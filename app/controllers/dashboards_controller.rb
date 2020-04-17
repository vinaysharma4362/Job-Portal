# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  def index
    if current_user
      if current_user.has_role? :admin
        redirect_to admin_dashboard_index_path
      end
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
