json.array! @past_movies do |past_movie|
  json.id past_movie.id
  json.title past_movie.title
  json.image past_movie.image
  json.user_id past_movie.user_id
end