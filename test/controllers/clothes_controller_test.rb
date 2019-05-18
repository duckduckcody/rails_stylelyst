require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothes_index_url
    assert_response :success
    clothes = @controller.instance_variable_get(:@clothes)
    assert_not_empty clothes, 'No clothes returned'
  end

  test "should get settings" do
    get clothes_settings_url
    assert_response :success
  end
end
