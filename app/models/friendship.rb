class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
  
  validates :user_id, :presence => true
  validates :friend_id, :presence => true
  
  validate :users_cant_be_equal
  
  def users_cant_be_equal
    errors.add(:user, "User can't be friend of himself") unless user_id != friend_id
  end

end

# status  = pending, accepted, denied
