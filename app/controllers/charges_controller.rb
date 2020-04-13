class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = 200000
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'inr',
    })

    if charge
      redirect_to new_company_job_post_path(current_company.id)
    end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
