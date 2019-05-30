Rails.application.routes.draw do
  post 'clothes/website_match'
  post 'clothes/get_clothes'
  get 'clothes/settings'
  get 'clothes/index'
  get 'clothes', to: 'clothes#index' 
  get '/', to: 'clothes#index'
end
