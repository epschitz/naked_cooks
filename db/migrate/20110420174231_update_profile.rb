class UpdateProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :name, :string
    add_column :profiles, :phrase, :string
    
    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
  end

  def self.down
    remove_column :profiles, :name, :string
    remove_column :profiles, :phrase, :string
    
    add_column :profiles, :first_name
    add_column :profiles, :last_name
  end
end
