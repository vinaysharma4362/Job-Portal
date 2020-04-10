# frozen_string_literal: true

# Company dashboard controller
class CompaniesDashboardsController < ApplicationController
  before_action :authenticate_company!
<<<<<<< Updated upstream
  def index; end
 
=======

  def index
    redirect_to company_job_posts_path(current_company.id) if current_company
  end

>>>>>>> Stashed changes
  def company_show
    @company = Company.all
  end
end
