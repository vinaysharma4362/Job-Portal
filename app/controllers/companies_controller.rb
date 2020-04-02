# frozen_string_literal: true

# companies controller
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @review = Review.new
  end
end
