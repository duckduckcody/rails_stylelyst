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

  test "all websites return clothes" do
    websites = Website.all
    categories = Category.all
    genders = Gender.all
    url_function = WebsiteUrlFunction.find_by(name: 'page')

    categories.each do |category|
      genders.each do |gender|
        websites.each do |website|
          user_settings = {gender: gender[:id], category: category[:id]}
          # can't find website_url object when scraping website
          clothes = website.scrape(user_settings, {page: '1'}, url_function)
          assert_not_empty clothes, "#{website_temp[:name]} didn't return any clothes"
        end
      end
    end
  end
end
