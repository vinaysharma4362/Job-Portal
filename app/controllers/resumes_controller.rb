# frozen_string_literal: true

# Resume for user controller
class ResumesController < ApplicationController
  before_action :find_resume, only: %i[edit update destroy show]
<<<<<<< Updated upstream
  before_action :find_user, only: %i[new edit create]
=======

>>>>>>> Stashed changes
  def index
    @resumes = current_user.resume
  end

  def new
    if @resume = current_user.resume
      redirect_to edit_user_resume_path
    else
      @resume = Resume.new
    end
  end

  def create
    @user = Resume.find_by(user_id: current_user)
    if @user == nil
      @resume = Resume.new(resume_params)
      @resume.user_id = current_user.id
      if @resume.save
        redirect_to session[:return_to], notice: 'Resume Uploaded.'
      else
        render :new
      end
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
<<<<<<< Updated upstream
    redirect_to user_resumes_path, notice: 'Resume destroyed.'
=======
    @apply_job = ApplyJob.where(user_id: @user)
    @apply_job.delete_all
    redirect_to resumes_path, notice: 'Resume destroyed.'
>>>>>>> Stashed changes
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
    params.require(:resume).permit(:file_name, :resume_file)
  end
end
