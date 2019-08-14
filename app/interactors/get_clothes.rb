class GetClothes
  include Interactor

  def call
    context.clothes = []
    if param_present?() 
      websites = JSON.parse(context.websites)
      context.clothes = websites.each_with_object([]) do |website_id, clothes|
        result = ScrapeWebsite.call({
          website: Website.find(website_id),
          category: context.category,
          url_function: WebsiteUrlFunction.find_by(name: 'page'),
          page_number: context.page
        })
        clothes.concat(result.scraped_content)
      end      
    end
  end

  def param_present?
    context.page.present? & context.category.present? & context.websites.present?
  end
end
