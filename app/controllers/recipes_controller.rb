class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_article, except: [:index, :new, :create]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Successfully created new recipe'
    else
      render :new
    end
  end

  def edit
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path) and return
    end
  end

  def update
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path) and return

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    if equal_with_current_user?(@recipe.user)
      @recipe.destroy
      redirect_to recipes_path
    else
       flash[:danger] = 'Wrong User'
      redirect_to(root_path)
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






