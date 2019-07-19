require 'rails_helper'

RSpec.describe RecipeType, type: :model do
  
  it "should not be valid" do
    recipe_type = RecipeType.new(name: '')
    expect(recipe_type).to_not be_valid
  end

  it "should be valid" do
    recipe_type = RecipeType.new(name: 'Brasileira')
    expect(recipe_type).to be_valid
  end

  it 'should be unique' do
    recipe_type = RecipeType.create(name: 'Brasileira')
    recipe_type_new = RecipeType.new(name: 'Brasileira')
    expect(recipe_type_new).to_not be_valid
  end

  it '' do
  end
end
