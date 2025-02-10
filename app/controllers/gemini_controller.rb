class GeminiController < ApplicationController
  def show
    client = Gemini.new
    @response = client.generate_content('始めてAPI通信をしています。成功しましたか？')
  end
end
