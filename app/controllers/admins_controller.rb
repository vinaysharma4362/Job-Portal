# frozen_string_literal: true

class AdminsController < ApplicationController
  def companies
    @companies = Company.all
  end

  def jobseekers
    @jobseekers = ApplyJob.eager_load(:user)
  end

  def job_posts
    @job_posts = JobPost.all
  end

  def destroy_jobseeker
    @user = User.find_by(id: params[:user_id])
    @user.destroy
  end
end
