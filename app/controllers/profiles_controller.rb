class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show

    user = @profile.user

    if params[:listing_status] == "Current listings"
      @listings = Listing.active.where(user: user)
    elsif params[:listing_status] == "Sold listings"
      @listings = Listing.inactive.where(user: user, active: false)
    else
      @listings = Listing.where(user: user)
    end

  end

  # GET /profiles/new
  def new
    if current_user.profile.present?
      redirect_to current_user.profile, notice: 'You can only have one profile per user'     
    else
      @profile = Profile.new
    end
  end

  # GET /profiles/1/edit
  def edit
    authorize @profile 
  end

  # POST /profiles
  # POST /profiles.json
  def create
    if current_user.profile.present?
      redirect_to current_user.profile, notice: 'You can only have one profile per user'     
    end
    
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    authorize @profile 
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      if params[:id]
        # A particular person's profile
        @profile = Profile.find_by!(id: params[:id])
      else
        # Signed in user profile
        @profile = Profile.find_by(user: current_user)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :about, :suburb, :state, :country, :image, :remove_image)
    end
end
