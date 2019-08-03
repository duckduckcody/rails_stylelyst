Rails.application.routes.draw do
  # settings controller
  get 'settings/get_all_settings'
  post 'settings/get_website_settings_by_category'
  
  # clothes controller
  post 'clothes/get_all_clothes'
  get '/', to: 'clothes#index'
end
