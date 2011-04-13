# coding: utf-8
require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    favorite = Favorite.new
    assert !favorite.valid?, "Favorite shoudn't be created"
  end
  
  test "nil user shouldn't be accept" do
    favorite = new(:user => nil)
    favorite.valid?
    assert favorite.errors[:user_id].any?, "nil :user shoudn't be accept"
  end
  
  test "nil recipe shouldn't be accept" do
    favorite = new(:recipe => nil)
    favorite.valid?
    assert favorite.errors[:recipe_id].any?, "nil :recipe shoudn't be accept"
  end
  
  test "should favorite recipe" do
    user_recipe = User.find_or_create_by_email(email:"hboaventura@gmail.com", password:"123456")
    recipe = user_recipe.recipes.create!(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    user_favorite = User.find_or_create_by_email(email:"hboaventura@muggyhill.com", password:"123456")
    favorite = user_favorite.favorites.new(recipe:recipe)
    
    assert favorite.valid?, "recipe should be created"
  end
  
  test "should not favorite self recipe" do
    user = User.find_or_create_by_email(email:"hboaventura@gmai.com", password:"123456")
    recipe = user.recipes.create(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    favorite = user.favorites.new(recipe:recipe)    
    assert !favorite.valid?, "self recipe shouldn't be accept"
  end
  
  private
  
  def new(options={})
    Favorite.new({
      :user   => User.new,
      :recipe => Recipe.new
    }.merge(options))
  end
  
end
