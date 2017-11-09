class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:new, :create]
  
  def index
    @paid_by_me
    @paid_to_me
  end

  def new
     # New charge for the form
     @charge = Charge.new
     # Set listing
     listing = Listing.find(params[:listing_id])
     @charge.listing = listing
  end
  
  def create
    # Amount in cents
    @amount = listing.price_cents
    @description = "Eucalyptus: #{listing.title}"
  
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'aud'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end  

  private
    def set_listing
      listing = Listing.find(params[:listing_id])  
    end

end
