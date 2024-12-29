class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:edit, :update, :destroy]
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def show 
    @warehouse = Warehouse.find(params[:id])
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
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update(warehouse_params)
      redirect_to warehouses_path, notice: "Warehouse updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy
    redirect_to warehouses_path, notice: "Warehouse deleted."
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id]) 
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :location)
  end
end
