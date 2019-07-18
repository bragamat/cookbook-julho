require 'rails_helper'

feature 'User remove a recipe' do
  scenario 'successfully' do
    #arrange
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: 'Brasileira',
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
  #act
  visit root_path
  click_on recipe.title
  click_on 'Excluir'

  #assert
  expect(current_path).to eq root_path
  expect(page).not_to have_content(recipe.title)
  end

  scenario 'and only one' do
    #arrange
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe_to_delete = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: 'Brasileira',
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    recipe_to_keep = Recipe.create(title: 'Bife a cavalo', difficulty: 'fácil',
                  recipe_type: recipe_type, cuisine: 'Brasileira',
                  cook_time: 30, ingredients: 'Carne, ovo, arroz',
                  cook_method: 'Fritar o bife, fritar o ovo. Jogar o ovo sob o bife e comer com arroz.')
    
    #act
    visit root_path
    click_on recipe_to_delete.title
    click_on 'Excluir'
   
    #assert 
    expect(current_path).to eq root_path
    expect(page).not_to have_content(recipe_to_delete.title)
    expect(page).to have_content(recipe_to_keep.title)

    
  end
end