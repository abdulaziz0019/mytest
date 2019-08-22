Rails.application.routes.draw do



  resources :articles
  root  'articles#home'
  get 'welcome/about', to: 'welcome#about'

  #sign-up
  resources :users, except: [:new]
  get 'signup', to: 'users#new'
  post 'users', to:'users#create'
  get  'login', to: 'seassions#new'
  post 'login' ,to: 'seassions#create'
  delete 'logout' ,to: 'seassions#destroy'
  get  'logout', to: 'seassions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
