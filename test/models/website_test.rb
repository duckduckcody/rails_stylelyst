# == Schema Information
#
# Table name: websites
#
#  id                      :integer          not null, primary key
#  name                    :string
#  url                     :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  query_string_key_page   :string
#  query_string_key_search :string
#  scraper_id              :integer
#

require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
end
