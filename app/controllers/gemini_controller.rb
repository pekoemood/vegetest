class GeminiController < ApplicationController
  def new;end

  def create
    prompt = params[:prompt]
    client = Gemini.new(prompt)
    @html_content = client.generate_content

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @html_content = markdown.render(@html_content)

    render :new, status: :unprocessable_entity
  end
end



