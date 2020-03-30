# frozen_string_literal: true

# company dashboard controller
class CompaniesDashboardsController < ApplicationController
  before_action :authenticate_company!

  def index
    if current_company
      redirect_to company_job_posts_path(current_company.id)
    end
  end
end
