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

  def destroy_jobseeker
    @user = User.find_by(id: params[:user_id])
    @user.destroy
  end
end
