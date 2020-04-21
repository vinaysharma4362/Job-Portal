# frozen_string_literal: true

class AdminsController < ApplicationController

  def index; end
  
  def companies
    @companies = Company.all
  end

  def jobseekers
    @jobseekers = ApplyJob.eager_load(:job_post, user: :resume).paginate(page: params[:page], per_page: 10)
  end

  def job_posts
    @job_posts = JobPost.all
  end

  def destroy_jobseeker
    @user = User.find_by(id: params[:user_id])
    @user.destroy
  end
end
