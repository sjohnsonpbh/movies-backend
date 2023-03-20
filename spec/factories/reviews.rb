FactoryBot.define do
  factory :review do
    user_rating { 1 }
    comment { "MyText" }
    user_id { "" }
    movie_id { "" }
  end
end
