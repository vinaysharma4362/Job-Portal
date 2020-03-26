# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user?
      redirect_to company_job_posts_path(current_company.id)
    end
  end
end
