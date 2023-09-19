require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  symbols_url = "https://api.exchangerate.host/symbols"
  resp = HTTP.get(symbols_url)
  pp raw_reponse = resp.to_s
  
  erb(:hello)
end

get("/:currency") do
  @currency = params.fetch("currency")
end

get("/:first_currency/:second_currency") do
end
