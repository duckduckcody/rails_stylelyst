require 'nokogiri'
require 'open-uri'

module HtmlService
  def self.get_html(url)
    Nokogiri.HTML(open(url))
  end

  def self.to_query(query_string_hash)
    '?' + query_string_hash.to_query
  end
end
