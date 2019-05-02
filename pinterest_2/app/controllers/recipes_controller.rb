class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    8.times {@recipe.ingredients.build}
  end

  def create
    byebug
    @recipe = Recipe.new(recipe_params(:name, :user_id))
    @ingredient = @recipe.ingredients.build(recipe_params(:ingredients[:name]))
    @recipe.recipe_ingredients.build(recipe_params(@ingredient.ingredient_id, :ingredients[:quantity]))
    if @recipe.invalid?
      render :new
    else
      @recipe.save
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
