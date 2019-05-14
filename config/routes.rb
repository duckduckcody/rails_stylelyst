Rails.application.routes.draw do
  get 'clothes/settings'
  get 'clothes/index'
  # get 'clothes/search'
  get 'clothes', to: 'clothes#index' 
  get '/', to: 'clothes#index'
end
