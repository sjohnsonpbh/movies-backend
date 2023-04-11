require 'net/http';

puts "Seeding movies"
def seed_movies

  page_num = 1
  
  while page_num < 50

    uri = URI('http://api.themoviedb.org/3/movie/popular')
    params = { :api_key => Rails.application.credentials.moviedb.API_KEY, :page => page_num, :language => 'en' }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    # puts movies.body if movies.is_a?(Net::HTTPSuccess)
    
    payload = res.body 
    
    # Parse into ruby hash
    payload = JSON.parse(payload)

    # movies_array is misleading a bit -> should be called payload
    # payload["results"] I believe is the movies 
    payload["results"].each do |movie|

      # Example of movie
      # {"adult"=>false, "backdrop_path"=>"/coWUgAjqwyu2W7YFlb71rlukPKZ.jpg", "genre_ids"=>[53], "id"=>1076605, "original_language"=>"es", "original_title"=>"Cazadora", "overview"=>"Psychological thriller where the character's strength, submerged in the landscape's majesty, leads us through a tense, bleak and chilling path.", "popularity"=>983.945, "poster_path"=>"/kOD2Xg7ihr51p6eXqzaY8hX5Uq3.jpg", "release_date"=>"2023-01-19", "title"=>"The Hunteress", "video"=>false, "vote_average"=>5.9, "vote_count"=>9}

      Movie.create(
        title: movie["title"],
        description: movie["overview"], 
        image_path: movie["backdrop_path"])
    end
    page_num += 1
  end
end

# puts "complete"

seed_movies();




