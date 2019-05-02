class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    3.times {@recipe.recipe_ingredients.build}
    3.times {@recipe.ingredients.build}

  end

  def create
    @recipe = Recipe.new(recipe_params(:name, :user_id))
    if @recipe.invalid?
      render :new
    else
      @recipe.save
      @recipe.recipe_ingredients_attributes = recipe_params(
        recipe_ingredients_attributes: [:quantity, ingredients: [:name]]
      )
      redirect_to recipe_path(@recipe)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def destroy
    Recipe.destroy(params[:id])
    redirect_to recipes_path
  end

  private

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end


end
