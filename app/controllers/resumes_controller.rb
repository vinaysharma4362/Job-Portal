# frozen_string_literal: true

# Resume for user controller
class ResumesController < ApplicationController
  load_and_authorize_resource
  before_action :find_resume, only: %i[edit update destroy show]

  def index
    @resumes = current_user.resume
  end

  def new
    @resume = Resume.new
  end

  def create
    @user = Resume.find_by(user_id: current_user)
    return unless @user.nil?

    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
    if @resume.save
      redirect_to session[:return_to], notice: 'Resume Uploaded.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: 'Resume updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    @apply_job = ApplyJob.where(user_id: @user)
    @apply_job.delete_all
    redirect_to resumes_path, notice: 'Resume destroyed.'
  end

  def resume_list
    @resumes = Resume.all
  end

  private

  def find_resume
    @resume = Resume.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def resume_params
    params.require(:resume).permit(:file_name, :resume_file)
  end
end
