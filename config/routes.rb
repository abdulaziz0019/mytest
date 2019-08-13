Rails.application.routes.draw do

  root  'welcome#home'
  get 'welcome/about', to: 'welcome#about'

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
