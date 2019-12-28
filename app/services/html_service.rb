require 'HTTParty'

module HtmlService
  def self.get_html(url)
    HTTParty.get(url)
  end
end
