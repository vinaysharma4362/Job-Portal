# frozen_string_literal: true

# Charges Controller
class ChargesController < ApplicationController
  def new; end

  def create
    @amount = 200_000
    customer = Stripe::Customer.create({ email: params[:stripeEmail],
                                         source: params[:stripeToken] })
    charge = Stripe::Charge.create({ customer: customer.id, currency: 'inr',
                                     amount: @amount,
                                     description: 'Rails Stripe customer' })
    redirect_to new_company_job_post_path(current_company.id) if charge
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
