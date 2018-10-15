require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address + "&key=AIzaSyA5qwIlcKjijP_Ptmv46mk4cCjuWhSzS78"
    parsed_data = JSON.parse(open(url).read)
    @lat = parsed_data.dig("results", 0, "geometry", "location", "lat").to_s
    @lng = parsed_data.dig("results", 0, "geometry", "location", "lng").to_s 
    
    url = "https://api.darksky.net/forecast/b9a02ebb30de92e038fd4378270b0dfc/" + @lat + "," + @lng
    parsed_data = JSON.parse(open(url).read)
    
    @current_temperature = parsed_data.dig("currently","temperature")
    
    @current_summary = parsed_data.dig("currently","summary")

    @summary_of_next_sixty_minutes = parsed_data.dig("minutely","summary")

    @summary_of_next_several_hours = parsed_data.dig("hourly","summary")

    @summary_of_next_several_days = parsed_data.dig("daily","summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
