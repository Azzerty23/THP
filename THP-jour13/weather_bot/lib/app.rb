require 'open_weather'
require "Dotenv"
require "pry"

Dotenv.load

# cities = {Paris: [], Montpellier: [43.610769, 3.876716]}
# puts OpenWeather::Current.geocode(cities['Montpellier'], options)['main']['temp'] # Montpellier

# # get current weather by city name
def get_weather(city)
  options = { units: "metric", APPID: ENV['OWM_API_KEY'], lang: "fr" }
  current = OpenWeather::Current.city(city, options)
end

# print cities[:Montpellier][0]
print get_weather(ARGV)
