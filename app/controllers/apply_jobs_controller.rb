# frozen_string_literal: true

# Apply job from the user
class ApplyJobsController < ApplicationController
  before_action :find_apply_job, only: %i[new create edit]
  before_action :find_company, only: %i[edit update destroy show]
  before_action :find_user, only: %i[new create edit]
  def index
    @apply_jobs = current_company.apply_jobs
  end

  def new
    @apply_job.new
  end

  def create
    @apply_job.new(apply_job_params)
    if @apply_job.save!
      redirect_to
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @apply_job.update(apply_job_params)
      redirect_to
    else
      render 'edit'
    end
  end

  def destroy
    @apply_job.destroy
    redirect_to
  end

  def show; end

  private

  def find_company
    @company = Company.find[params[:id]]
  end

  def find_apply_job
    @apply_job = ApplyJob.find(params[:id])
  end

  def find_user
    @user = User.find[params[:id]]
  end

  apply_job_params.require(:apply_jobs).permit(:status, :job_post_id,
                                               :company_id, :user_id)
end
