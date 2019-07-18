class RecipesController < ApplicationController
  
  # before_action set_recipe_types, only: [:new, :edit]
  
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    set_recipe_types
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      set_recipe_types
      render :new
    end
  end

  def edit
    set_recipe_types
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      set_recipe_types
      render :edit
    end
  end

  private

  def set_recipe_types
    @recipe_types = RecipeType.all
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, 
    :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
