class ChargesController < ApplicationController
  
  class Amount
    def self.default
      15_00
    end
  end
  
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )
    
    flash[:notice] = "Thanks for supporting the site, #{current_user.email}! Feel free to create private wikis."
    current_user.premium!
    redirect_to wikis_path(current_user)
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.default
    }
  end
  
  def downgrade
    current_user.standard!
    current_user.wikis.update_all(private: false)
    redirect_to root_path
  end
end
