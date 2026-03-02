class BatchesController < ApplicationController
  before_action :require_authentication

  def index
    @batches = current_user.batches.includes(:recipe).order(made_on: :desc)
  end

  def show
    @batch = current_user.batches.find(params[:id])
  end

  def new
    @batch = current_user.batches.build(
      recipe_id: params[:recipe_id],
      made_on: Date.today
    )
  end

  def create
    @batch = current_user.batches.build(batch_params)

    if @batch.save
      redirect_to batches_path, notice: "Batch was successfully logged."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @batch = current_user.batches.find(params[:id])
    @batch.destroy
    redirect_to batches_path, notice: "Batch log was deleted."
  end

  def edit
    @batch = current_user.batches.find(params[:id])
  end

  def update
    @batch = current_user.batches.find(params[:id])

    if @batch.update(batch_params)
      redirect_to @batch, notice: "Batch was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:recipe_id, :made_on, :notes)
  end
end
