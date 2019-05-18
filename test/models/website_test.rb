require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
    test "all websites return clothes" do
        websites = Website.all
        categories = Category.all
        genders = Gender.all
        url_function = WebsiteUrlFunction.find_by(name: 'page')
    
        puts "Testing all website urls"
        categories.each do |category|
          genders.each do |gender|
            websites.each do |website|
              puts "website: #{website[:name]}, gender: #{gender[:name]}, category: #{category[:name]}"
              user_settings = {:gender_id => gender[:id], :category_id => category[:id]}
              clothes = website.scrape(user_settings, {:page => '1'}, url_function)
			  assert_not_empty clothes, "#{website[:name]} didn't return any clothes"
            end
          end
        end
    end
end
