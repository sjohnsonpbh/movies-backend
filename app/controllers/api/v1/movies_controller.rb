module Api 
  module V1 
    class MoviesController < Api::V1::ApplicationController 
      def create 
        
        result = Movies::Operations.new_movie(params, @current_user)
        byebug
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          movie: MovieBlueprint.render_as_hash(result.payload), status: 201
        }
        render_success(payload: payload)
      end

      def update  
        result = Movies::Operations.update_movie(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            movie: MovieBlueprint.render_as_hash(result.payload), status: 201
          }
          render_success(payload: payload)
      end

      def index 
        movies = Movie.all 
        payload = {
          movie: MovieBlueprint.render_as_hash(movies), 
           status: 200
        }
        render_success(payload: payload)
      end
    end
  end
end