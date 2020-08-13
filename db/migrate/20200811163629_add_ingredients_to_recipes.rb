class AddIngredientsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :recipes, foreign_key: true
  end
end


