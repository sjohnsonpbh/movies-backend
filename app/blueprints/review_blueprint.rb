class ReviewBlueprint < Blueprinter::Base 
  identifier: :id 
  fields :user_rating, :comment, :user_id, :movie_id
end