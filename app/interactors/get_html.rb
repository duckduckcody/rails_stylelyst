require 'selenium-webdriver'
require 'HTTParty'

class GetHtml
  include Interactor

  def call
    url = context.url
    emulate_browser_get = context.emulate_browser_get
    cachedResult = Rails.cache.read(url)
    if cachedResult
      context.html = Nokogiri::HTML::Document.new(cachedResult)
    else
      if emulate_browser_get
        html = selenium_get(url)
      else
        html = html_get(url)
      end
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

  def html_get(url)
    HTTParty.get(url)
  end
end
