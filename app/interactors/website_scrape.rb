class WebsiteScrape
  include Interactor

  def call
    website_url = context.website.website_url_htmls
      .find_by(
          category: context.category,
          website_url_function: context.url_function
      )
     result = WebsiteUrlScrape.call({
      website_url: website_url,
      page: context.page
    })
    context.clothes = result.result
  end
end
