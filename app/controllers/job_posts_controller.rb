# frozen_string_literal: true

# dashboard controller
class JobPostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy show]

  def index
    @job_posts = JobPost.all
  end

  def new
    @company  = Company.find(params[:company_id])
    @job_post = JobPost.new(company_id: @company.id)
  end

  def create
    @job_post = JobPost.new(post_params)
    @job_post.company_id = current_company.id
      if @job_post.save
        redirect_to company_job_posts_path
      else
        render :new
      end
  end

  def show; end

  def edit; end

  def update
    if @job_post.update(post_params)
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

  private

  def set_post
    @company = Company.find(current_company.id)
    @job_post = JobPost.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def post_params
    params.require(:job_post).permit(:job_title, :description, :job_type,
                                     :location, :required_skill, :extra_skill,
                                     :salary_max, :last_apply_date, :language,
                                     :job_field, :vacancy, :status, :salary_min)
  end
end
