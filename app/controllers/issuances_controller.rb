class IssuancesController < ApplicationController
  
  def index
    @issuances = Issuance.all
  end

  def show
    @issuance = Issuance.find(params[:id])
  end
  
  def edit
    @issuance = Issuance.find(params[:id])
  end

  def new
    @issuance = Issuance.new
    @warehouses = Warehouse.all
    @branches = Branch.all
    @inventories = Inventory.all
  end

  def create
    @issuance = Issuance.new(issuance_params)
    if @issuance.save
      redirect_to issuances_path, notice: 'Inventory issued successfully.'
    else
      render :new
    end
  end

  def destroy
    @issuance = Issuance.find(params[:id])
    @issuance.destroy
    redirect_to issuances_path, notice: 'Issuance was successfully deleted.'
  end

  def update
    @issuance = Issuance.find(params[:id])
    if @issuance.update(issuance_params)
      redirect_to @issuance, notice: 'Issuance was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def issuance_params
    params.require(:issuance).permit(:inventory_id, :warehouse_id, :branch_id, :quantity)
  end
end
