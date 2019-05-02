class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :show, :update]
  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  private

  def ingredients_params
    params.require(:ingredient).permit!
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
