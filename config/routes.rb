Rails.application.routes.draw do
 	
  get 'password_reset/new'

  get 'password_reset/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'


	root to: 'pages#index'

	resources :drivers do
		resources :cars
		resources :invoices
		resources :bookings
	end

	resources :admins

	resources :account_activations, only: [:edit]


end
