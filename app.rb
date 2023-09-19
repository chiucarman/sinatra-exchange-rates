require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

@first_country = "USD"
@second_country = "INR"

@conversion_url = "https://api.exchangerate.host/convert?from=#{@first_country}&to=#{@second_country}"



get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  symbols_url = "https://api.exchangerate.host/symbols"
  resp = HTTP.get(symbols_url)
  raw_reponse = resp.to_s

  parsed_response = JSON.parse(raw_reponse)
  @symbols = parsed_response.fetch("symbols")

  erb(:hello)
end

get("/:currency") do
  @currency = params.fetch("currency")

  symbols_url = "https://api.exchangerate.host/symbols"
  resp = HTTP.get(symbols_url)
  raw_reponse = resp.to_s

  parsed_response = JSON.parse(raw_reponse)
  @symbols = parsed_response.fetch("symbols")

  erb(:currency)
end

get("/:first_country/:second_country") do
  @first_country = params.fetch("first_country")
  @second_country = params.fetch("second_country")

  @conversion_url = "https://api.exchangerate.host/convert?from=#{@first_country}&to=#{@second_country}"

  erb(:conversion)
end
