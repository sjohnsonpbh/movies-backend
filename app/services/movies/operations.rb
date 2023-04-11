module Movies 
  module Operations 
    def self.new_movie(params, current_user)
      movie = current_user.movies.new(title: params[:title], description: params[:description], director: params[:director], mpa_rating: params[:mpa_rating], movie_length: params[:movie_length], image_path: [:image_path])

      return ServiceContract.success(movie) if movie.save

      ServiceContract.error(movie.errors.full_messages)
    end

    def self.create_review(params, current_user)
      review = current_user.review.new(user_rating: params[:user_rating], comment: params[:comment], movie_id: params[:movie_id], user_id: params[:user_id])

      return ServiceContract.success(review) if review.save

      ServiceContract.error(review.errors.full_messages)
    end
  end
end