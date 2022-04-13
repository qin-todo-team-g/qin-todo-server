Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :users, only: [:show, :update, :destroy]
      get '/public', to: 'public#public'
      get '/private', to: 'private#private'
    end
  end
end
