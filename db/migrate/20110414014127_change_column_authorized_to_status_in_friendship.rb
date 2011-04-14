class ChangeColumnAuthorizedToStatusInFriendship < ActiveRecord::Migration
  def self.up
    add_column :friendships, :status, :string, :default => "pending"
    remove_column :friendships, :authorized
  end

  def self.down
    add_column :friendships, :authorized, :boolean, :default => false
    remove_column :friendships, :status
  end
end
