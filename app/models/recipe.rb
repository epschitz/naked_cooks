class Recipe < ActiveRecord::Base
    
  has_many   :comments
  has_many   :favorites
  belongs_to :user
  belongs_to :category
  
  before_create do |recipe|
    recipe.permalink = recipe.name.parameterize
  end
  
  validates :name, :presence => true, :length => { :within => 3..150 }
  validates :description, :presence =>true, :length => { :minimum => 4 }
  validates_presence_of :user_id
  validates_presence_of :category_id
  
end
