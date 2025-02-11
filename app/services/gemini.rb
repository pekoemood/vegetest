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
        contents: [{
          parts: [{ text: @prompt }]
      }]}.to_json
    }

    response = self.class.post('/gemini-2.0-flash:generateContent',options)

    if response.code == 200
      formatted_response(response.parsed_response.deep_symbolize_keys)
      #JSON.parse(response.body, symbolize_names: true)
    else
      { error: 'API request failed', status: response.code }
    end
  end

  private

  def formatted_response(response)
    response[:candidates][0][:content][:parts][0][:text]
  end

end

















#   BASE_URL = 'https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent'


#   def initialize
#     @api_key = Rails.application.credentials[:gemini][:api_key]
#   end

#   def generate_content(prompt)
#     response = self.class.post(
#       "#{BASE_URL}?key=#{@api_key}",
#       headers: { "Content-Type" => "application/json" },
#       body: {
#         contents: [
#           {
#             parts: [{ text: prompt }]
#           }
#         ] 
#       }.to_json
#     )

#     if response.code == 200
#       JSON.parse(response.body.to_s, symbolize_names: true)
#     else
#       { error: 'API request failed', status: response.code }
#     end
#   end
# end