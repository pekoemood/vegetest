class GeminiController < ApplicationController
  def new
    @html_content = nil
  end

  def create
    prompt = params[:prompt]
    client = Gemini.new(prompt)
    @html_content = client.generate_content

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @html_content = markdown.render(@html_content)

    render :new
  end

end



