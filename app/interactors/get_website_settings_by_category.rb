class GetWebsiteSettingsByCategory
  include Interactor

  def call
    context.websites =
      WebsitePage.where(category: context.category).map(&:website).sort_by(
        &:name
      )
  end
end
