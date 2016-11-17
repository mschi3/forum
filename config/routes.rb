Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "posts#index"
	resources :posts do
  	resources :comments
  	member do
 		get :dashboard
 		end
  end
  resources :categories
  #resource :userposts

  resource :user

  #get 'users/:id/posts' => 'users#posts', :as => :user_posts
end
