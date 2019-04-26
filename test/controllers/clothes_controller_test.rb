require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothes_index_url
    assert_response :success
  end

end
