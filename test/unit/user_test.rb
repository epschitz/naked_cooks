require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    user = User.new
    assert !user.valid?, "User shoudn't be created"
  end
  
  test "should not accept equal user" do
    user1 = new(email:'hboaventura@gmail.com', password:'donald')
    user1.save
    
    user2 = new(email:'hboaventura@gmail.com', password:'donald')
    assert !user2.valid?, "User with same e-mail shound't be created"
  end
  
  test "should not accept invalid email" do
    user = new(:email => 'teste')
    user.valid?    
    assert user.errors[:email].any?, "invalid :email shouldn't be accepted"    
  end
  
  test "should not accept empty password" do
    user = new(:password => nil)
    user.valid?
    assert user.errors[:password].any?, "nil :password shouldn't be accepted"    
  end
  
  test "should not accept short password" do
    user = new(:password => "abcde")
    user.valid?
    assert user.errors[:password].any?, "short :password shouldn't be accepted"    
  end
  
  private
  
  def new(options={})
    User.new({
      :email    => "email@test.com",
      :password => "password",
    }.merge(options))
  end
  
end
