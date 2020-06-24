Rails.application.routes.draw do
	root 'welcome#home'
	get 'about', to: 'welcome#about'

	resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	get 'signup', to: 'users#new'
  	resources :users, except: [:new]

  	get 'login', to: 'sessions#new'
  	post 'login', to: 'sessions#create'
  	delete 'logout', to: 'sessions#destroy'
end
