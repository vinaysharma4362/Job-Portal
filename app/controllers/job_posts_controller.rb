# frozen_string_literal: true

# dashboard controller
class JobPostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.company_id = current_company.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to company_job_posts_path }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to company_job_posts_path,
                  notice: 'Job Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to company_job_posts_path, notice: 'Job Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def post_params
    params.require(:post).permit(:job_title, :description, :job_type, :location,
                                 :required_skill, :extra_skill, :salary_min,
                                 :salary_max, :last_apply_date, :language,
                                 :job_field, :vacancy, :status)
  end
end
