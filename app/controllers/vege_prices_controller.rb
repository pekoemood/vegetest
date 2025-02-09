class VegePricesController < ApplicationController
  def show
    vege_service = VegePrice.new(13360, 'v')
    @vege_price = JSON.parse(vege_service.get_vege_price.body, symbolize_names: true)

    @error_message = '野菜の価格は取得できませんでした' if @vege_price.nil?
  end
end
