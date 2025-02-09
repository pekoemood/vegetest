require "test_helper"

class VegePricesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get vege_prices_show_url
    assert_response :success
  end
end
