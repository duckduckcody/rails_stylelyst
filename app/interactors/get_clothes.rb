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
        result = WebsiteScrape.call({
          website: website,
          category: category,
          url_function: url_function,
          page: page
        })
        clothes.concat(result.clothes)
      end      
    end
  end

  def param_present?
    context.page.present? & context.category.present? & context.websites.present?
  end
end
