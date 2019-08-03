class GetClothes
  include Interactor

  def call
    context.clothes = []
    if context.page.present? & context.category.present? & context.websites.present?
      page = context.page
      category = context.category
      websites = JSON.parse(context.websites)
      url_function = WebsiteUrlFunction.find_by(name: 'page')
      context.clothes = websites.each_with_object([]) do |website_id, clothes|
        website = Website.find(website_id)
        clothes.concat(website.scrape(category, page, url_function))
      end      
    end
  end
end
