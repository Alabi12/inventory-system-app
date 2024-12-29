class BranchesController < ApplicationController
  def index
    @branches = Branch.all
  end

  def new
    @branch = Branch.new
  end
  
  def show
    @branch = Branch.find(params[:id])
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      redirect_to branches_path, notice: "Branch created successfully."
    else
      render :new
    end
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])
    if @branch.update(branch_params)
      redirect_to branches_path, notice: "Branch updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    redirect_to branches_path, notice: "Branch deleted."
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :location)
  end
end
