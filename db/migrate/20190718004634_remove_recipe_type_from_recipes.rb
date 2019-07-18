class RemoveRecipeTypeFromRecipes < ActiveRecord::Migration[5.2]
  def up
    remove_column :recipes, :recipe_type, :string
  end

  def down
    add_column :recipes, :recipe_type, :string
  end
end
