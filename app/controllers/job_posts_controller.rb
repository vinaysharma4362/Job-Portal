# frozen_string_literal: true

# dashboard controller
class JobPostsController < ApplicationController
  before_action :find_post, only: %i[edit update destroy show user_job_post]
  before_action :find_company, only: %i[new edit create user_job_post]

  def index
    @job_posts = current_company.job_posts
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_post_params)
    if @job_post.save!
      redirect_to company_job_posts_path, notice: 'Job added'
    else
      flash[:alert] = 'Not added'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @job_post.update(job_post_params)
      redirect_to company_job_posts_path,
                  notice: 'Job Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job_post.destroy
    redirect_to company_job_posts_path, notice: 'Job Post was successfully destroyed.'
  end

  def user_job_post
    @user_job_post = @job_post.users
  end

  def apply_job
    @apply_job = ApplyJob.new(user_id: current_user.id,
                              job_post_id: params[:id], apply: true)
    if @apply_job.save!
      redirect_to user_job_post_path, notice: 'Job Appllied successful'
    else
      render 'new'
    end
  end
  
  def search
    @job_posts = JobPost.where(job_title: params[:job_title], location: params[:location])
  end

  private

  def find_post
    @job_post = JobPost.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def job_post_params
    params.require(:job_post).permit(:job_title, :description, :job_type,
                                     :location, :required_skill, :extra_skill,
                                     :salary_max, :last_apply_date, :language,
                                     :job_field, :vacancy, :status,
                                     :company_id, :salary_min)
  end
end
