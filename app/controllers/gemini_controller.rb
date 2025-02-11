class GeminiController < ApplicationController
  def show
    client = Gemini.new('今日の沖縄の天候を簡単に教えてください')
    @response = client.generate_content
  end
end
