class Movie < ApplicationRecord
 
  has_many :users, through: :movie_users 

  validate :title, :description, :image_path
end
