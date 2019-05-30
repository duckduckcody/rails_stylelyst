require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothes_index_url
    assert_response :success
    # clothes = @controller.instance_variable_get(:@clothes)
    # assert_not_empty clothes, 'No clothes returned'
  end

  test "should get settings" do
    get clothes_settings_url
    assert_response :success
  end

  test "all websites return clothes" do
		url_function = WebsiteUrlFunction.find_by(name: 'page')
		categories = Category.all
		categories.each do |category|
      websites = WebsiteUrlHtml
        .where(category: category)
        .map{ |category| category.website }
			websites.each do |website|
        puts "website: #{website[:name]}, gender: #{category.gender[:name]}, category: #{category[:name]}"      
        post "/clothes/get_clothes",
          params: { category: category[:id], page: '1', websites:JSON.generate([website[:id]]) }
        assert_not_empty response.body, "#{website[:name]} didn't return any clothes"
			end	
		end
	end
end
