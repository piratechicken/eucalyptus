class SpeciesController < ApplicationController
  before_action :set_specie, only: [:show, :edit, :update, :destroy]

  # GET /species
  # GET /species.json
  def index
    @species = Specie.all
  end

  # GET /species/1
  # GET /species/1.json
  def show
  end

  # GET /species/new
  def new
    @specie = Specie.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  # POST /species.json
  def create
    @specie = Specie.new(specie_params)

    respond_to do |format|
      if @specie.save
        format.html { redirect_to @specie, notice: 'Species was successfully created.' }
        format.json { render :show, status: :created, location: @specie }
      else
        format.html { render :new }
        format.json { render json: @specie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    respond_to do |format|
      if @specie.update(specie_params)
        format.html { redirect_to @specie, notice: 'Species was successfully updated.' }
        format.json { render :show, status: :ok, location: @specie }
      else
        format.html { render :edit }
        format.json { render json: @specie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy
    @specie.destroy
    respond_to do |format|
      format.html { redirect_to specie_url, notice: 'Specie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specie
      @specie = Specie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specie_params
      params.require(:specie).permit(:name, :common_name, :growth_form_id, :description, :image)
    end
end
