class WeatherController < ApplicationController
  def show
    city_name = params[:city] || 'Tokyo'
    weather_service = WeatherService.new(city_name)
    @weather = JSON.parse(weather_service.get_weather.body, symbolize_names: true)
    @weather_1 = weather_service.get_weather
    


    @error_message = '天気情報が取得できませんでした' if @weather.nil?
  end
end
