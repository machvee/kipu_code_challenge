class TreatmentModelsController < ApplicationController
  before_action :set_treatment_model, only: [:show, :edit, :update, :destroy]

  # GET /treatment_models
  # GET /treatment_models.json
  def index
    @treatment_models = TreatmentModel.all
  end

  # GET /treatment_models/1
  # GET /treatment_models/1.json
  def show
  end

  # GET /treatment_models/new
  def new
    @treatment_model = TreatmentModel.new
  end

  # GET /treatment_models/1/edit
  def edit
  end

  # POST /treatment_models
  # POST /treatment_models.json
  def create
    @treatment_model = TreatmentModel.new(treatment_model_params)

    respond_to do |format|
      if @treatment_model.save
        format.html { redirect_to @treatment_model, notice: 'Treatment model was successfully created.' }
        format.json { render :show, status: :created, location: @treatment_model }
      else
        format.html { render :new }
        format.json { render json: @treatment_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_models/1
  # PATCH/PUT /treatment_models/1.json
  def update
    respond_to do |format|
      if @treatment_model.update(treatment_model_params)
        format.html { redirect_to @treatment_model, notice: 'Treatment model was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment_model }
      else
        format.html { render :edit }
        format.json { render json: @treatment_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_models/1
  # DELETE /treatment_models/1.json
  def destroy
    @treatment_model.destroy
    respond_to do |format|
      format.html { redirect_to treatment_models_url, notice: 'Treatment model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_model
      @treatment_model = TreatmentModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_model_params
      params.require(:treatment_model).permit(:description, :necessity, :patient_id)
    end
end
