# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  before_action :set_path
  def index
    if current_user
      redirect_to admins_index_path if current_user.has_role? :admin
    end
    @count = JobPost.where(status: :active).count
    @job_posts = JobPost.order('created_at desc')
                        .limit(10)
                        .where(status: 'active')
  end

  def user_job_post
    @job_posts = JobPost.all
  end

  def company_list
    @companies = Company.all
  end

  private
  def set_path
    session[:return_to] = request.fullpath
  end
end
