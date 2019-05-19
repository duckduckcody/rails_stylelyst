Rails.application.routes.draw do
  post 'clothes/website_match'
  get 'clothes/settings'
  get 'clothes/index'
  get 'clothes', to: 'clothes#index' 
  get '/', to: 'clothes#index'
end
