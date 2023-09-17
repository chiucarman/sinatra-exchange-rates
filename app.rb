require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:hello)
end

get("/:currency") do
end

get("/:first_currency/:second_currency") do
end
