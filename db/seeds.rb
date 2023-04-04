# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# def news_dataset
#   api_data = { key: best_news_secret_key }
#   news = RestClient.get("https://newsapi.org/v2/top-headlines?   q=coronavirus&apiKey=#{api_data[:key]}")
#   news_array = JSON.parse(news)["articles"]
#   news_array.each do |s|
#     Story.create(title: s["title"], author: s["author"], content:   s["content"], url: s["url"])
#   end
# end

require 'HttpClient';

def seed_movies
  movies = HttpClient.get(`https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}&language=en-US&page=1`)
  byebug
  movie_array = JSON.parse(news)["articles"]
  movie_array.each do |s|
    Movie.create(title: s["title"], author: s["author"], content:   s["content"], url: s["url"])
  end
end




