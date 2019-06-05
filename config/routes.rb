Rails.application.routes.draw do
  post 'clothes/website_match'
  post 'clothes/get_clothes'
  get 'clothes/get_settings'
  get '/', to: 'clothes#index'
end
