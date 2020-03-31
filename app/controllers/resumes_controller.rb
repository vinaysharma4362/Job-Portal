# frozen_string_literal: true

# Resume for user controller
class ResumesController < ApplicationController
  before_action :find_resume, only: %i[edit update destroy show]

  def index
    @resume = Resume.find_by(user_id: current_user.id)
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @resume = Resume.new(user_id: current_user.id)
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
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

  private

  def find_resume
    @user = User.find_by(id: current_user.id)
    @resume = Resume.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def resume_params
    params.require(:resume).permit(:file_name, :resume_file)
  end
end
