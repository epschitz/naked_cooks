require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    category = Category.new
    assert !category.valid?, "Category shoudn't be created"
  end
  
  test "shouldn't accept existing category" do
    category1 = Category.create(:name => 'teste')
    category2 = Category.new(:name => 'teste')
    
    assert !category2.save, "existing :name shoudn't be accepted"
  end
  
  test "shouldn't accept short category name" do
    category = Category.new(:name => 'abc')
    
    assert !category.valid?, "short :name shoudn't be accepted"
  end
  
end
