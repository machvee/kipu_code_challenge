class MedicationOrdersController < ApplicationController
  before_action :set_medication_order, only: [:show, :edit, :update, :destroy]

  # GET /medication_orders
  # GET /medication_orders.json
  def index
    @medication_orders = MedicationOrder.all
  end

  # GET /medication_orders/1
  # GET /medication_orders/1.json
  def show
  end

  # GET /medication_orders/new
  def new
    @medication_order = MedicationOrder.new
  end

  # GET /medication_orders/1/edit
  def edit
  end

  # POST /medication_orders
  # POST /medication_orders.json
  def create
    @medication_order = MedicationOrder.new(medication_order_params)

    respond_to do |format|
      if @medication_order.save
        format.html { redirect_to @medication_order, notice: 'Medication order was successfully created.' }
        format.json { render :show, status: :created, location: @medication_order }
      else
        format.html { render :new }
        format.json { render json: @medication_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medication_orders/1
  # PATCH/PUT /medication_orders/1.json
  def update
    respond_to do |format|
      if @medication_order.update(medication_order_params)
        format.html { redirect_to @medication_order, notice: 'Medication order was successfully updated.' }
        format.json { render :show, status: :ok, location: @medication_order }
      else
        format.html { render :edit }
        format.json { render json: @medication_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medication_orders/1
  # DELETE /medication_orders/1.json
  def destroy
    @medication_order.destroy
    respond_to do |format|
      format.html { redirect_to medication_orders_url, notice: 'Medication order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication_order
      @medication_order = MedicationOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medication_order_params
      params.require(:medication_order).permit(:name, :unit, :dosage, :route, :necessity, :patient_id)
    end
end
