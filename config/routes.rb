Rails.application.routes.draw do
  get 'clothes/settings'
  get 'clothes/index'
  get 'clothes', to: 'clothes#index' 
end
