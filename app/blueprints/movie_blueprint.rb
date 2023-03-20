class MovieBlueprint < Blueprinter::Base 
  identifier :id 
  fields :title, :description, :director, :mpa_rating, :movie_length, :image_path
end