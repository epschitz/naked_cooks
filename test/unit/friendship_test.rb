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
  
  def new(options={})
    Friendship.new({
      :user    => User.new,
      :friend  => User.new
    }.merge(options))
  end
  
end
