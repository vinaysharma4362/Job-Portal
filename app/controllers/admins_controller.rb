class AdminsController < ApplicationController
  def companies
    @companies = Company.all
  end

  def jobseekers
  end

  def job_posts
  end
end