class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update,:destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Successfullu created new recipe'
    else
      render :new
    end
  end

  def edit
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @recipe = Recipe.find(params[:id])
    session_notice(:danger, 'Wrong User') unless equal_with_current_user?(@recipe.user)
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @recipe = Recipe.find(params[:id])

    if equal_with_current_user?(recipe.user)
      recipe.destroy
      redirect_to recipes_path
    else
      session_notice(:danger, 'Wrong User')
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end

