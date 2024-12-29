class StockMovementsController < ApplicationController
  def index
    @stock_movements = StockMovement.all
  end

  def new
    @stock_movement = StockMovement.new
  end

  def create
    @stock_movement = StockMovement.new(stock_movement_params)
    @stock_movement.date ||= Time.current # Set date to current time if not provided
    if @stock_movement.save
      redirect_to stock_movements_path, notice: "Stock movement created successfully."
    else
      render :new
    end
  end

  def edit
    @stock_movement = StockMovement.find(params[:id])
  end

  def update
    @stock_movement = StockMovement.find(params[:id])
    if @stock_movement.update(stock_movement_params)
      redirect_to stock_movements_path, notice: "Stock movement updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @stock_movement = StockMovement.find(params[:id])
    @stock_movement.destroy
    redirect_to stock_movements_path, notice: "Stock movement deleted."
  end

  private
  
  def stock_movement_params
    params.require(:stock_movement).permit(:source_type, :source_id, :destination_type, :destination_id, :inventory_id, :quantity, :status, :date)
  end
end
