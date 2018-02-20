class InwardModulesController < ApplicationController
  before_action :set_inward_module, only: [:show, :edit, :update, :destroy]

  # GET /inward_modules
  # GET /inward_modules.json
  def index
    @inward_modules = InwardModule.all
  end

  #load product on ajax call to fetch rate
  def load_item_data
    @product = InwardModule.find_by_id(params[:product_id]).present? ? InwardModule.find(params[:product_id]) : InwardModule.unscoped.find_by_id(params[:product_id])
    render :json => [@product.product.price, @product.quantity]
  end

  # GET /inward_modules/1
  # GET /inward_modules/1.json
  def show
  end

  # GET /inward_modules/new
  def new
    @inward_module = InwardModule.new
  end

  # GET /inward_modules/1/edit
  def edit
  end

  # POST /inward_modules
  # POST /inward_modules.json
  def create
    @inward_module = InwardModule.new(inward_module_params)
    @product = Product.find(params[:inward_module][:product_id])
    respond_to do |format|
      if @inward_module.save
        @product.update!(quantity: @inward_module.quantity)
        format.html { redirect_to @inward_module, notice: 'Inward module was successfully created.' }
        format.json { render :show, status: :created, location: @inward_module }
      else
        format.html { render :new }
        format.json { render json: @inward_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inward_modules/1
  # PATCH/PUT /inward_modules/1.json
  def update
    respond_to do |format|
      if @inward_module.update(inward_module_params)
        format.html { redirect_to @inward_module, notice: 'Inward module was successfully updated.' }
        format.json { render :show, status: :ok, location: @inward_module }
      else
        format.html { render :edit }
        format.json { render json: @inward_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inward_modules/1
  # DELETE /inward_modules/1.json
  def destroy
    @inward_module.destroy
    respond_to do |format|
      format.html { redirect_to inward_modules_url, notice: 'Inward module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inward_module
      @inward_module = InwardModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inward_module_params
      params.require(:inward_module).permit(:date, :inward_number, :product_id, :quantity)
    end
end