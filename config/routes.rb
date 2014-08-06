Rails.application.routes.draw do
  resources :users

  get 'pages/home'
	get '/auth/:provider/callback' => 'sessions#create'
	get '/auth/failure' => 'sessions#failure'
	get '/signout' => 'sessions#destroy', :as => :signout

  root 'pages#home'

end
