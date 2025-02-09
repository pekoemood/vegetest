class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(city_name)
    @options = {query: { q: city_name, appid:Rails.application.credentials[:weather][:api_key],lang: 'ja'}}
  end

  def get_weather
    self.class.get('/weather',@options)
  end
end