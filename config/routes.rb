Rails.application.routes.draw do
  resources :past_movies do
    collection do
      get 'search'
    end
  end
end
