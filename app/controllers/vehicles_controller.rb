class VehiclesController < ApplicationController
  before_action :set_warehouse, only: [:index, :new, :create]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = @warehouse.vehicles
  end

  def new
    @vehicle = @warehouse.vehicles.build
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @warehouse = @vehicle.warehouse
  end
  

  def create
    @vehicle = @warehouse.vehicles.build(vehicle_params)
    if @vehicle.save
      redirect_to warehouse_vehicles_path(@warehouse), notice: 'Vehicle was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to warehouse_vehicles_path(@vehicle.warehouse), notice: 'Vehicle was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to warehouse_vehicles_path(@vehicle.warehouse), notice: 'Vehicle was successfully deleted.'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find_by(id: params[:warehouse_id])
    if @warehouse.nil?
      flash[:alert] = "Warehouse not found."
      redirect_to warehouses_path
    end
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_number, :capacity)
  end
end
