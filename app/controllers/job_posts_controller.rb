# frozen_string_literal: true

# dashboard controller
class JobPostsController < ApplicationController
  before_action :find_post, only: %i[edit update destroy show ]
  before_action :find_company, only: %i[new edit create]

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

  def job_post_apply
    @job_posts = JobPost.all
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
