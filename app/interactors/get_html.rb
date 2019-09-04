require 'open-uri'

class GetHtml
  include Interactor

  def call    
    url = context.url
    cachedResult = Rails.cache.read(url)
    if cachedResult
      context.html = Nokogiri::HTML::Document.new(cachedResult)
    else
      result = Nokogiri::HTML(open(url))
      Rails.cache.write(result.serialize, expires_in: Rails.configuration.cache_expiry)
      context.html = result
    end
  end
end
