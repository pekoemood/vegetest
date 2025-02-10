class Gemini
  include HTTParty 
  BASE_URL = 'https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent'


  def initialize
    @api_key = Rails.application.credentials[:gemini][:api_key]
  end

  def generate_content(prompt)
    response = self.class.post(
      "#{BASE_URL}?key=#{@api_key}",
      headers: { "Content-Type" => "application/json" },
      body: {
        contents: [
          {
            parts: [{ text: prompt }]
          }
        ] 
      }.to_json
    )

    if response.code == 200
      JSON.parse(response.body.to_s)
    else
      { error: 'API request failed', status: response.status }
    end
  end
end