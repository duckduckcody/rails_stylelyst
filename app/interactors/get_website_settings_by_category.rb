class GetWebsiteSettingsByCategory
  include Interactor

  def call
    context.websites = WebsitePage
      .where(category: context.category)
      .map{ |category| category.website }
      .sort_by { |website| website.name }
  end
end
