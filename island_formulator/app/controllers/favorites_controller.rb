class FavoritesController < ApplicationController
  before_action :require_authentication
  before_action :set_recipe, only: [ :create, :destroy ]

  def index
    @favorite_recipes = current_user.favorite_recipes.with_attached_photo
  end

  def create
    current_user.favorites.find_or_create_by(recipe: @recipe)
    redirect_back fallback_location: recipe_path(@recipe), notice: "Recipe added to favorites."
  end

  def destroy
    favorite = current_user.favorites.find_by(recipe: @recipe)
    favorite&.destroy
    redirect_back fallback_location: recipe_path(@recipe), notice: "Recipe removed from favorites."
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:recipe_id])
  end
end