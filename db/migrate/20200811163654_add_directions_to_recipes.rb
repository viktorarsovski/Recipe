class AddDirectionsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :directions, :recipes, foreign_key: true
  end
end

