Rails.application.routes.draw do
  root 'static_pages#top'
  get 'tasks/index'

  get 'tasks/create'

  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
  end
end
