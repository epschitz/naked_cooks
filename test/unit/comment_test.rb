# coding: utf-8

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  
  end
  
  test "should be invalid" do
    comment = Comment.new
    assert !comment.valid?, "Comment shoudn't be created"
  end
  
  test "shouldn't accept nil body" do
    comment = new(:body => nil)
    comment.valid?
    assert comment.errors[:body].any?, ":body shoudn't be nil"
  end
  
  test "shouldn't accept short body value" do
    comment = new(:body => "ab")
    comment.valid?
    assert comment.errors[:body].any?, "short :body shoudn't be accept"
  end
  
  test "should be a valid comment" do
    user = User.new(:email => "hboaventura@gmai.com", :password => "123456")
    recipe = user.recipes.new(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    comment = recipe.comments.new(
      body: 'Teste de comentário'
    )
    assert comment.valid?, "the comment should be valid"
  end
  
  private
  
  def new(options={})
    Comment.new({
      :body   => "Body",
      :user   => User.new,
      :recipe => Recipe.new
    }.merge(options))
  end
  
end
