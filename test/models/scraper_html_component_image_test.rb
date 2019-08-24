# == Schema Information
#
# Table name: scraper_html_components
#
#  id              :integer          not null, primary key
#  name            :string
#  selector        :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scraper_html_id :integer
#

require 'test_helper'

class ScraperHtmlComponentImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
