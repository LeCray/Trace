Rails.application.routes.draw do
 	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	get '/login' 		=> 'sessions#new'
	post '/login' 		=> 'sessions#create'
	delete '/logout' 	=> 'sessions#destroy'

	root to: 'pages#index'

	resources :drivers do
		resources :cars
		resources :invoices
		resources :bookings
	end	

	resources :admins
	resources :account_activations, only: [:edit]
	resources :password_reset
	resources :messages, only: [:index, :create]	

	get '/admin_password_change' 		=> 'password_change#admin_edit'
	patch '/admin_password_change' 		=> 'password_change#admin_update'

	get '/driver_password_change' 		=> 'password_change#driver_edit'
	patch '/driver_password_change' 	=> 'password_change#driver_update'


	namespace :api do
		namespace :v1 do
			post '/mobile_login' 			=> 'mobile_login#mobile_login'

			post '/new_booking'				=> 'bookings#new_booking'
			post '/cancel_booking' 			=> 'bookings#cancel_booking'
			post '/confirm_booking'			=> 'bookings#confirm_booking'
			post '/mobile_check_booking'	=> 'bookings#mobile_check_booking'

			post '/fcm'					=> 'fcm#update_fcm_token'
			post '/data_stream' 		=> 'data_stream#data_stream'
		end
	end

	mount ActionCable.server, at: '/cable'

end
