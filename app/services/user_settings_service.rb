class UserSettingsService < ApplicationService
  def initialize(cookies)
    cookies[:websites] ||= "[1]"
    @user_settings = {
      :gender_id => (cookies[:gender] ||= "1"),
      :category_id => (cookies[:category] ||= "1"),
      :website_ids => JSON.parse(cookies[:websites])
    }
  end

  def call
    @user_settings
  end
end