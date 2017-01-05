Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resource :session
  resources :users
  root "welcome#index"

  resources :movies do
    resources :reviews
  end

end
