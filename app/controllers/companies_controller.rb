# frozen_string_literal: true

# companies controller
class CompaniesController < ApplicationController
  before_action :find_company, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to admins_companies_path,
                  notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to admins_companies_path,
                notice: 'Job Post was successfully destroyed.'
  end

  private

  def find_company
    @company = Company.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def company_params
    params.require(:company).permit(:title, :about, :address,
                                    :city, :state, :country,
                                    :pincode, :contact_no, :website,
                                    :status, :logo, :facebook,
                                    :instagram, :linkedin)
  end
end
