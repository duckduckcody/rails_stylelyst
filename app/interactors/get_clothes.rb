class GetClothes
  include Interactor

  def call
    context.clothes = []
    if param_present?()
      page = context.page
      category = context.category
      websites = JSON.parse(context.websites)
      url_function = WebsiteUrlFunction.find_by(name: 'page')
      context.clothes = websites.each_with_object([]) do |website_id, clothes|
        website = Website.find(website_id)
        clothes.concat(website.scrape(category, page, url_function))

        # scrape (website, category, page, url_function)

        # website -> get_website_url
        # website_url -> get_scraper
        # scraper -> get_each_html_component
        # html_componet -> 
      end      
    end
  end

  def param_present?
    context.page.present? & context.category.present? & context.websites.present?
  end
end
