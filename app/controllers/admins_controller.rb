# frozen_string_literal: true

# Admin controller
class AdminsController < ApplicationController
  load_and_authorize_resource
  def index; end
  
  def companies
    @companies = Company.all.paginate(page: params[:page], per_page: 10)
  end

  def jobseekers
    @jobseekers = ApplyJob.eager_load(:user).paginate(page: params[:page], per_page: 10)
  end

  def job_posts
    @job_posts = JobPost.all.paginate(page: params[:page], per_page: 10)
  end

  def resumes
    @resumes = Resume.all.paginate(page: params[:page], per_page: 10)
  end

  def applied_job
    @user = User.find_by(id: params[:user_id])
    @posts = ApplyJob.eager_load(:job_post).where("apply_jobs.user_id=?", @user).paginate(page: params[:page], per_page: 10)
  end

  def destroy_jobseeker
    @user = User.find_by(id: params[:user_id])
    @user.destroy
    redirect_to admins_jobseekers_path
  end
end
