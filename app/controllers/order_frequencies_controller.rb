class OrderFrequenciesController < ApplicationController
  before_action :set_order_frequency, only: [:show, :edit, :update, :destroy]

  # GET /order_frequencies
  # GET /order_frequencies.json
  def index
    @order_frequencies = OrderFrequency.all
  end

  # GET /order_frequencies/1
  # GET /order_frequencies/1.json
  def show
  end

  # GET /order_frequencies/new
  def new
    @order_frequency = OrderFrequency.new
  end

  # GET /order_frequencies/1/edit
  def edit
  end

  # POST /order_frequencies
  # POST /order_frequencies.json
  def create
    @order_frequency = OrderFrequency.new(order_frequency_params)

    respond_to do |format|
      if @order_frequency.save
        format.html { redirect_to @order_frequency, notice: 'Order frequency was successfully created.' }
        format.json { render :show, status: :created, location: @order_frequency }
      else
        format.html { render :new }
        format.json { render json: @order_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_frequencies/1
  # PATCH/PUT /order_frequencies/1.json
  def update
    respond_to do |format|
      if @order_frequency.update(order_frequency_params)
        format.html { redirect_to @order_frequency, notice: 'Order frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_frequency }
      else
        format.html { render :edit }
        format.json { render json: @order_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_frequencies/1
  # DELETE /order_frequencies/1.json
  def destroy
    @order_frequency.destroy
    respond_to do |format|
      format.html { redirect_to order_frequencies_url, notice: 'Order frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_frequency
      @order_frequency = OrderFrequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_frequency_params
      params.require(:order_frequency).permit(:value, :unit, :medication_order_id)
    end
end
