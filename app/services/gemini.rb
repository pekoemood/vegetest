class Gemini
  include HTTParty 
  base_uri 'https://generativelanguage.googleapis.com/v1beta/models'
  

  def initialize(prompt)
    @api_key = Rails.application.credentials[:gemini][:api_key]
    @prompt = prompt
  end


  def generate_content
    options = {
      query: {key: @api_key},
      headers: { 'Content-Type' => 'application/json'},
      body: { 
        system_instruction: {
          parts: {
            text: 'あなたはプロの料理人です。料理の経験が浅いユーザーにもわかりやすい説明をすることで、有名です。以下の質問に答えてください'
          }
        },
        contents: [{
          parts: [{ text: @prompt }]
      }]}.to_json
    }

    response = self.class.post('/gemini-2.0-flash:generateContent',options)

    if response.code == 200
      formatted_response(response.parsed_response.deep_symbolize_keys)
    else
      { error: 'API request failed', status: response.code }
    end
  end

  private

  def formatted_response(response)
    response[:candidates][0][:content][:parts][0][:text]
  end
end