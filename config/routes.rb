Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
  get '/public', to: 'public#public'
  get '/private', to: 'private#private'
end
