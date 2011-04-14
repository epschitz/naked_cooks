require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    friendship = Friendship.new
    assert !friendship.valid?, "Friendship shoudn't be created"
  end
  
  test "shouldn't allow nil user" do
    friendship = new(user:nil)
    assert !friendship.valid?, ":user shoudn't be nil"
  end
  
  test "shouldn't allow nil friend" do
    friendship = new(friend:nil)
    assert !friendship.valid?, ":friend shoudn't be nil"
  end
  
  test "shouldn't allow be friend of himself" do
    user = User.find_or_create_by_email(:email => "hboaventura@gmail.com", :password => "123456")
    friendship = user.friendships.new(friend:user)

    assert !friendship.valid?, "User shoudn't be friend of himself"
  end
  
  test "should create a friendship waiting for authorizing" do
    
    user = User.find_or_create_by_email(:email => "hboaventura@gmail.com", :password => "123456")
    friend = User.find_or_create_by_email(:email => "friendships@gmail.com", :password => "123456")
    
    friendship = user.friendships.new(friend:friend)
        
    assert friendship.valid?, "friendship should be valid"
    assert friendship.status == "pending", "friendship should be waiting for acception"
  end
  
  test "should create a friendship and authorize it" do
    
    user = User.find_or_create_by_email(:email => "hboaventura@gmail.com", :password => "123456")
    friend = User.find_or_create_by_email(:email => "friendships@gmail.com", :password => "123456")
    
    friendship = user.friendships.new(friend:friend)
    friendship.status = "accepted"
        
    assert friendship.valid?, "friendship should be valid"
    assert friendship.status == "accepted", "friendship should be accepted"
  end
  
  test "should create a friendship and deny it" do
    
    user = User.find_or_create_by_email(:email => "hboaventura@gmail.com", :password => "123456")
    friend = User.find_or_create_by_email(:email => "friendships@gmail.com", :password => "123456")
    
    friendship = user.friendships.new(friend:friend)
    friendship.status = "denied"
        
    assert friendship.valid?, "friendship should be valid"
  assert friendship.status == "denied", "friendship shouldn't' be accepted"
  end
  
  def new(options={})
    Friendship.new({
      :user    => User.new,
      :friend  => User.new
    }.merge(options))
  end
  
end
