# frozen_string_literal: true

# ApplyJob Controller
class ApplyJobsController < ApplicationController
  before_action :find_apply_job, only: [:update]
  def index
    @apply_jobs = ApplyJob.eager_load(:user, :job_post)
                          .where('apply_jobs.user_id=?', current_user.id)
  end

  def update
    @applyjob.update(status: params[:status])
    return unless @applyjob

    @jobpost = JobPost.eager_load(:company)
                      .where('job_posts.id=?', @applyjob.job_post_id)
    redirect_to view_candidates_company_job_post_path(@jobpost.first.company
                                                      .id, @jobpost.first.id)
  end

  private

  def find_apply_job
    @applyjob = ApplyJob.find_by(id: params[:id])
  end
end
