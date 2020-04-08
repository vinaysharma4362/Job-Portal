# frozen_string_literal: true

# companies controller
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @reviews = Review.where(company_id: @company.id).order('created_at DESC')

    @avg_review = if @reviews.blank?
                    0
                  else
                    @reviews.average(:rating).round(2)
                  end
  end
end
