require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  symbols_url = "https://api.exchangerate.host/symbols"
  resp = HTTP.get(symbols_url)
  raw_reponse = resp.to_s

  parsed_response = JSON.parse(raw_reponse)
  pp symbols = parsed_response.fetch("symbols")

  erb(:hello)
end

get("/:currency") do
  @currency = params.fetch("currency")
end

get("/:first_currency/:second_currency") do
end
