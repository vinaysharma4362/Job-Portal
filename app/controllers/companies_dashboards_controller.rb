# frozen_string_literal: true

# company dashboard controller
class CompaniesDashboardsController < ApplicationController

  def index
<<<<<<< Updated upstream
    redirect_to company_job_posts_path(current_company.id) if current_company
=======
    if current_company
      redirect_to company_job_posts_path(current_company.id)
    end
>>>>>>> Stashed changes
  end

  def company_show
    @company = Company.all
  end

  

end
