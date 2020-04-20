# frozen_string_literal: true

# Admin controller
class AdminsController < ApplicationController
  def index; end

  def companies
    @companies = Company.all
    @pages = @companies.paginate(page: params[:page])
  end

  def jobseekers
    @jobseekers = ApplyJob.eager_load(:user)
    @pages = @jobseekers.paginate(page: params[:page])
  end

  def job_posts
    @job_posts = JobPost.all
    @pages = @job_posts.paginate(page: params[:page])
  end

  def destroy_jobseeker
    @user = User.find_by(id: params[:user_id])
    @user.destroy
  end
end
