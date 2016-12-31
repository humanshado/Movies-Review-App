Rails.application.routes.draw do

  root "welcome#index"

  resources :movies do
    resources :reviews
  end

end
