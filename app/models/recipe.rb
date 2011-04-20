class Recipe < ActiveRecord::Base
  has_attached_file :image, 
                    :styles =>  { :big => ["640x480>"], :thumb => ["200x150#"] },
                    :url  => "/assets/recipes/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/recipes/:id/:style/:basename.:extension"
    
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
  
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  
end
