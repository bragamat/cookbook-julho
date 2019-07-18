class CreateRecipeTypes < ActiveRecord::Migration[5.2]
  def up
    create_table :recipe_types do |t|
      t.string :name
      t.timestamps
    end
    
    add_reference :recipes, :recipe_type, foreign_key: true
  end

  def down
    remove_reference :recipes, :recipe_type, foreign_key: true
    drop_table :recipe_types
  end
end
