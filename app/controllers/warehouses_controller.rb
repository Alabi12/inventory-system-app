class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy, :dashboard, :slow_movement_report, :vehicle_usage]
  
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    puts "Warehouse found: #{@warehouse.inspect}" # Debugging output
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to warehouses_path, notice: "Warehouse created successfully."
    else
      render :new
    end
  end

  def edit
    # No need to call Warehouse.find(params[:id]) here since it's already done in before_action
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to warehouses_path, notice: "Warehouse updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to warehouses_path, notice: "Warehouse deleted."
  end


  
  private

  def dashboard
    @inventories = @warehouse.inventories # Assuming Inventory has a warehouse_id
  end

  def slow_movement_report
    @warehouse = Warehouse.find(params[:id])
    @slow_moving_items = @warehouse.inventories.where('quantity < ?', 50)
  
    # Debugging: Check if the variable is set properly
    puts "Slow moving items: #{@slow_moving_items.inspect}"
  end
 
  
  def vehicle_usage
    Rails.logger.info("Fetching vehicle usage for warehouse #{params[:warehouse_id]}")
    @vehicle_movements = VehicleMovement.where(warehouse_id: params[:warehouse_id])
  end  

  def set_warehouse
    if params[:id].present?
      @warehouse = Warehouse.find_by(id: params[:id])
      unless @warehouse
        flash[:alert] = "Warehouse not found."
        redirect_to warehouses_path
      end
    else
      flash[:alert] = "No warehouse ID provided."
      redirect_to warehouses_path
    end
  end  
    
  def warehouse_params
    params.require(:warehouse).permit(:name, :location, :warehouse_id)
  end
end
