class GetHtml
  include Interactor

  def call
    url = context.url
    emulate_browser_get = context.emulate_browser_get
    cachedResult = CacheService.get(url)
    if cachedResult
      context.html = Nokogiri.HTML(cachedResult)
    else
      if emulate_browser_get
        html = emulate_get(url)
      else
        html = html_get(url)
      end
      result = Nokogiri.HTML(html)
      CacheService.write(url, result.serialize)
      context.html = result
    end
  end

  def emulate_get(url)
    EmulateBrowserService.get_html(url)
  end

  def html_get(url)
    HtmlService.get_html(url)
  end
end
