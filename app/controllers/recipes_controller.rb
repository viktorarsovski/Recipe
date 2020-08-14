class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_recipe, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
    8.times { @recipe.ingredients.build }
    6.times { @recipe.directions.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Successfully created new recipe'
    else
      flash[:danger] = 'You can\'t save empty recipe'
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
    end

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

  def edit_ingredients
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path) and return
    end
  end

  def edit_directions
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path) and return
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def correct_user
    unless equal_with_current_user?(@recipe.user)
      flash[:danger] = 'Wrong User'
      redirect_to(root_path)
    end
  end

  def instruction_params
    params.permit(:name)
  end
end
