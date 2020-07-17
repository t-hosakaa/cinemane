Rails.application.routes.draw do
  root to: 'past_movies#index'
  devise_for :users
  get "users/show" => "users#show"
  resources :past_movies do
    collection do
      get 'top'
      get 'search'
    end
  end
  resources :groups
end
