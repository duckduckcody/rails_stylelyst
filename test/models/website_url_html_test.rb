# == Schema Information
#
# Table name: website_url_htmls
#
#  id                      :integer          not null, primary key
#  url_extension           :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  website_id              :integer
#  category_id             :integer
#  website_url_function_id :integer
#  scraper_html_id         :integer
#

require 'test_helper'

class WebsiteUrlHtmlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
