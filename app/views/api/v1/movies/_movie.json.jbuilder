# app/views/movies/_movie.json.jbuilder
json.extract! movie, :id, :title, :description, :year

json.director do
json.extract! movie.director, :id, :name
end

json.actors movie.actors, :id, :name
