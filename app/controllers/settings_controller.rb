class SettingsController < ApplicationController
    def get_all_settings
		render :json => {
			'genders': Gender.all,
			'categories': Category.all
		}
    end

    def get_website_settings_by_category
        result = WebsiteMatchByCategory.call(params)
        render :json => {'websites': result.websites}
    end
end
