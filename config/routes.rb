Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      patch '/tasks/:id/done', to: 'tasks#done' 
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
end
