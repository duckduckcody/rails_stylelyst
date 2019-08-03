class SettingsController < ApplicationController
    def get_all_settings
      result = GetAllSettings.call(params)
      render :json => result.settings
    end

    def get_website_settings_by_category
      result = GetWebsiteSettingsByCategory.call(params)
      render :json => {'websites': result.websites}
    end
end
