class IngredientsController < ApplicationController
  before_action :require_authentication
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = Current.user.ingredients
  end

  def show
  end

  def new
    @ingredient = Current.user.ingredients.new
  end

  def edit
  end

  def create
    @ingredient = Current.user.ingredients.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: "Ingredient was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy!
    respond_to do |format|
      format.html { redirect_to ingredients_path, notice: "Ingredient was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_ingredient
    @ingredient = Current.user.ingredients.find(params.require(:id))
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :category, :description, :notes, tag_ids: [])
  end
end
