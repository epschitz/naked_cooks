class Category < ActiveRecord::Base
  
  has_many :recipes

  before_create do |category|
    category.permalink = category.name.parameterize
  end
  
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 4 }
  
end
