require 'selenium-webdriver'
require 'HTTParty'

class GetHtml
  include Interactor

  def call
    url = context.url
    cachedResult = Rails.cache.read(url)
    if cachedResult
      context.html = Nokogiri::HTML::Document.new(cachedResult)
    else
      html = selenium_get(url)
      result = Nokogiri.HTML(html)
      Rails.cache.write(
        result.serialize,
        expires_in: Rails.configuration.cache_expiry
      )
      context.html = result
    end
  end

  def selenium_get(url)
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to url
    html = driver.page_source
    driver.quit
    return html
  end

  def open_uri_get(url)
    HTTParty.get(url)
  end
end
