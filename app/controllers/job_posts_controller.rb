# frozen_string_literal: true

# dashboard controller
class JobPostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy show]

<<<<<<< Updated upstream
  def index; end
=======
  def index
    @job_posts = JobPost.all
  end
>>>>>>> Stashed changes

  def new
    @company  = Company.find(params[:company_id])
    @job_post = JobPost.new(company_id: @company.id)
  end

  def create
<<<<<<< Updated upstream
    @post = House.new(post_params)
=======
    @job_post = JobPost.new(post_params)
    @job_post.company_id = current_company.id
>>>>>>> Stashed changes
    respond_to do |format|
      if @job_post.save
        format.html { redirect_to company_job_posts_path }
      else
        format.html { render :new }
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @job_post.update(post_params)
      redirect_to company_job_posts_path,
                  notice: 'House Profile was successfully updated.'
    else
      render :edit
    end
  end

<<<<<<< Updated upstream
  def destroy; end
=======
  def destroy
    @job_post.destroy
    redirect_to company_job_posts_path, notice: 'Job Post was successfully destroyed.'
  end
>>>>>>> Stashed changes

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
