class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:new, :create]
  
  def index
    @paid_by_me = Charge.where(user: current_user)

    # Get sold user listings
    sold_listings = Listing.inactive.where(user: current_user)
    @paid_to_me = Charge.where(listing: sold_listings)
  end

  def new
    redirect_to @listing if @listing.active == false
    # New charge for the form
    @charge = Charge.new
    # Set listing
    @charge.listing = @listing
  end
  
  def create
    # Amount in cents
    @amount = @listing.price_cents
    @description = "Eucalyptus: #{@listing.title}"
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
        
      # If success then create in db, update listing and send email to seller
      new_charge = Charge.new(user: current_user, listing: @listing, charge_identifier: charge.id)
      new_charge.save
      @listing.active = false
      # Why do validations stop this from saving??
      @listing.save(validate: false)
      SoldMailer.sold_notification(@listing, current_user).deliver_now

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end  

  private
    def set_listing
      @listing = Listing.find(params[:listing_id] || params.dig(:charge, :listing_id))
    end

end
