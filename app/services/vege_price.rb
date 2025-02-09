class VegePrice
  include HTTParty 
  base_uri 'https://api.cultivationdata.net'

  def initialize(mc, cat)
    @options = { query: { mc: mc, cat: cat}}
  end

  def get_vege_price
    self.class.get('/mcdata', @options)
  end
end