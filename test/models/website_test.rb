require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
	test "all websites return clothes" do
		url_function = WebsiteUrlFunction.find_by(name: 'page')
		categories = Category.all
		categories.each do |category|
		    websites = WebsiteUrlHtml
      			.where(category: category)
				.map{ |category| category.website }
			websites.each do |website|
				puts "website: #{website[:name]}, gender: #{category.gender[:name]}, category: #{category[:name]}"
				user_settings = {:category_id => category[:id]}
				clothes = website.scrape(user_settings, {:page => '1'}, url_function)
				assert_not_empty clothes, "#{website[:name]} didn't return any clothes"
			end	
		end
	end
end
