class Movie < ApplicationRecord
  has_many :users, through: :movie_user
  has_many :users, through: :review 

  validate :title, :description, :director, :mpa_rating, :movie_length, :image_path
end
