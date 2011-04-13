class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :recipe

  validates :body, :presence => true, :length => { :minimum => 3 }

end
