module Api 
  module V1 
    class MoviesController < Api::V1::ApplicationController 
      skip_before_action :authenticate, only: %i[index show]

      def create_review 
        # post @current_user and movie id should be added to user_movie table
        result = Movies::Operations.create_review(params, @current_user)
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          review: ReviewBlueprint.render_as_hash(result.payload), status: 201
        }
        render_success(payload: payload)
      end


      def create 
        result = Movies::Operations.new_movie(params, @current_user)
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
        byebug
        movies = Movie.all 
        payload = {
          movie: MovieBlueprint.render_as_hash(movies), 
           status: 200
        }
        render_success(payload: payload)
        console.log(payload)
      end

      def show 
        movie = Movie.find(params[:id])
        payload = {
          movie: MovieBlueprint.render_as_hash(movie),
          status: 200
        }
        render_success(payload: payload)
      end

      def review 
        # get movie from reviews
      end

      def create_user_movie 
        # post @current_user and movie_id should be added to review table
      end

      def user_movie 
        # get movie from user_movie
      end
    end
  end
end