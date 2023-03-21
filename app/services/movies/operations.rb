module Movies 
  module Operations 
    def self.new_movie(params, current_user)
      movie = current_user.movies.new(title: params[:title], description: params[:description], director: params[:director], mpa_rating: params[:mpa_rating], movie_length: params[:movie_length], image_path: [:image_path])

      return ServiceContract.success(movie) if movie.save

      ServiceContract.error(movie.errors.full_messages)
    end
  end
end