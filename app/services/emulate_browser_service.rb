module EmulateBrowserService
  def self.make_headless_chrome_driver
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless])
    Selenium::WebDriver.for(:chrome, options: options)
  end

  def self.get_html(url)
    driver = self.make_headless_chrome_driver
    driver.navigate.to url
    html = driver.page_source
    driver.quit
    return html
  end
end
