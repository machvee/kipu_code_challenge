class DiagnosticProceduresController < ApplicationController
  before_action :set_diagnostic_procedure, only: [:show, :edit, :update, :destroy]

  # GET /diagnostic_procedures
  # GET /diagnostic_procedures.json
  def index
    @diagnostic_procedures = DiagnosticProcedure.all
  end

  # GET /diagnostic_procedures/1
  # GET /diagnostic_procedures/1.json
  def show
  end

  # GET /diagnostic_procedures/new
  def new
    @diagnostic_procedure = DiagnosticProcedure.new
  end

  # GET /diagnostic_procedures/1/edit
  def edit
  end

  # POST /diagnostic_procedures
  # POST /diagnostic_procedures.json
  def create
    @diagnostic_procedure = DiagnosticProcedure.new(diagnostic_procedure_params)

    respond_to do |format|
      if @diagnostic_procedure.save
        format.html { redirect_to @diagnostic_procedure, notice: 'Diagnostic procedure was successfully created.' }
        format.json { render :show, status: :created, location: @diagnostic_procedure }
      else
        format.html { render :new }
        format.json { render json: @diagnostic_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnostic_procedures/1
  # PATCH/PUT /diagnostic_procedures/1.json
  def update
    respond_to do |format|
      if @diagnostic_procedure.update(diagnostic_procedure_params)
        format.html { redirect_to @diagnostic_procedure, notice: 'Diagnostic procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnostic_procedure }
      else
        format.html { render :edit }
        format.json { render json: @diagnostic_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnostic_procedures/1
  # DELETE /diagnostic_procedures/1.json
  def destroy
    @diagnostic_procedure.destroy
    respond_to do |format|
      format.html { redirect_to diagnostic_procedures_url, notice: 'Diagnostic procedure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_procedure
      @diagnostic_procedure = DiagnosticProcedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnostic_procedure_params
      params.require(:diagnostic_procedure).permit(:description, :moment, :patient_id)
    end
end
