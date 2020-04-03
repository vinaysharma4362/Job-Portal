# frozen_string_literal: true

# Review controller
class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit update destroy show]
  before_action :find_company

  def create
    @review = @company.reviews.build(review_params)
    if @review.save!
      redirect_to @company
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @review.update(review_params)
      redirect_to company_reviews_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy!
    redirect_to company_reviews_path(@company)
  end

  private

  def find_review
    @review =@company.reviews.find(params[:id])
  end
  
  def find_company
    @company = Company.find(params[:company_id])
  end

  def review_params
    params.require(:review).permit(:rating, :review_desc, :company_id)
  end
end
