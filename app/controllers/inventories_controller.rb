class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:edit, :update, :destroy]
  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: "Inventory created successfully."
    else
      render :new
    end
  end

  def update
    @inventory = Inventory.find(params[:id])

    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: 'Inventory updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
  
  def inventory_params
    params.require(:inventory).permit(:name, :sku, :quantity, :reorder_level, :warehouse_id, :branch_id)
  end
end
