# frozen_string_literal: true

# Resume for user controller
class ResumesController < ApplicationController
  load_and_authorize_resource
  before_action :find_resume, only: %i[edit update destroy show]
  before_action :find_user, only: %i[new edit create]
  def index
    @resumes = current_user.resume
  end

  def new
      @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to user_resumes_path, notice: 'Resume created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @resume.update(resume_params)
      redirect_to user_resumes_path, notice: 'Resume updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to user_resumes_path, notice: 'Resume destroyed.'
  end

  def resume_list
    @resumes = Resume.all
  end

  private

  def find_resume
    @resume = Resume.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def resume_params
    params.require(:resume).permit(:file_name, :resume_file, :user_id)
  end
end
