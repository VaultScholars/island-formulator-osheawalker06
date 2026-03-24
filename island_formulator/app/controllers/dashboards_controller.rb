class DashboardsController < ApplicationController
  before_action :require_authentication

  def show
    @recent_recipes = Current.user.recipes.order(created_at: :desc).limit(5)
    @recent_batches = Current.user.batches.includes(:recipe).order(made_on: :desc).limit(5)

    @stats = {
      ingredients: Current.user.ingredients.count,
      recipes: Current.user.recipes.count,
      inventory: Current.user.inventory_items.count,
      batches: Current.user.batches.count
    }
  end
end
