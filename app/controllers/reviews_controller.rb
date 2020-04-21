# frozen_string_literal: true

# Review controller
class ReviewsController < ApplicationController
  before_action :find_company
  before_action :find_review, only: %i[edit update destroy show]

  def new
    @review = Review.new
  end

  def create
    @review = @company.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save!
      redirect_to review_list_company_reviews_path(@company)
    else
      render :new
    end
  end

  def review_list
    @reviews = Review.where(company_id: @company.id).order('created_at DESC')
  end

  def edit; end

  def show; end

  def update
    if @review.update(review_params)
      redirect_to review_list_company_reviews_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy!
    redirect_to review_list_company_reviews_path(@company)
  end

  private

  def find_review
    @review = @company.reviews.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  def review_params
    params.require(:review).permit(:rating, :review_desc, :company_id, :user_id)
  end
end
