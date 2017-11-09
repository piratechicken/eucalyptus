class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index

    # If loacation radius param passed from form select, get lisitings within radius
    if params[:radius_search].present?
      lat = current_user.profile.latitude
      long = current_user.profile.longitude
      range = params[:radius_search]
      profiles = Profile.near([lat, long], range, :units => :km)
      # OK, well, it works...
      radius_listings = []
      profiles.each do |profile|
        if profile.user.listings.active.length > 0
          profile.user.listings.active.each do |listing|
            radius_listings << listing
          end
        end
      end
    # Or else return all listings
    else 
      radius_listings = Listing.active
    end

    if params[:species_search].present?
      species_listings = Listing.active.where(specie: params[:species_search])
    else
      species_listings = Listing.active      
    end
    
    if params[:growth_form_search].present?
      species = Specie.where(growth_form: params[:growth_form_search])
      growth_form_listings = Listing.active.where(specie: species)      
    else
      growth_form_listings = Listing.active  
    end

    # Listings to show is the intersection of all searches
    @listings = radius_listings & species_listings & growth_form_listings

  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit
    authorize @listing
    if @listing.active == false
      flash[:notice] = 'You cannot edit a sold listing'
      redirect_to @listing
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.active = true
    
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @listing
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :specie_id, :user_id, :description, :price_cents, :image, :remove_image)
    end
end
