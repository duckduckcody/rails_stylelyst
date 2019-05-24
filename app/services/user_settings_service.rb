class UserSettingsService < ApplicationService
  def initialize(cookies)
    @user_settings = {
      :gender_id => cookies[:gender],
      :category_id => cookies[:category],
      :website_ids => cookies[:websites] ? JSON.parse(cookies[:websites]) : []
    }
  end

  def call
    @user_settings
  end
end