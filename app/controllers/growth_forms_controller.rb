class GrowthFormsController < ApplicationController
  before_action :set_growth_form, only: [:show, :edit, :update, :destroy]

  # GET /growth_forms
  # GET /growth_forms.json
  def index
    @growth_forms = GrowthForm.all
  end

  # GET /growth_forms/1
  # GET /growth_forms/1.json
  def show
  end

  # GET /growth_forms/new
  def new
    @growth_form = GrowthForm.new
  end

  # GET /growth_forms/1/edit
  def edit
  end

  # POST /growth_forms
  # POST /growth_forms.json
  def create
    @growth_form = GrowthForm.new(growth_form_params)

    respond_to do |format|
      if @growth_form.save
        format.html { redirect_to @growth_form, notice: 'Growth form was successfully created.' }
        format.json { render :show, status: :created, location: @growth_form }
      else
        format.html { render :new }
        format.json { render json: @growth_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growth_forms/1
  # PATCH/PUT /growth_forms/1.json
  def update
    respond_to do |format|
      if @growth_form.update(growth_form_params)
        format.html { redirect_to @growth_form, notice: 'Growth form was successfully updated.' }
        format.json { render :show, status: :ok, location: @growth_form }
      else
        format.html { render :edit }
        format.json { render json: @growth_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growth_forms/1
  # DELETE /growth_forms/1.json
  def destroy
    @growth_form.destroy
    respond_to do |format|
      format.html { redirect_to growth_forms_url, notice: 'Growth form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growth_form
      @growth_form = GrowthForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def growth_form_params
      params.require(:growth_form).permit(:name, :description, :image_data)
    end
end
