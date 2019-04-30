class UserSettingsService < ApplicationService
  def initialize(cookies)
    @user_settings = {
      :gender_id => (cookies[:gender_id] ||= "1"),
      :category_id => (cookies[:category_id] ||= "1"),
      :website_ids => Array(cookies[:website_ids] ||= "1")
    }
  end

  def call
    @user_settings
  end
end