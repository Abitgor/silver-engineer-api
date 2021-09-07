Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               confirmations: 'confirmations',
               passwords: 'passwords',
               registrations: 'registrations',
               sessions: 'sessions',
             }
  namespace :api do
    namespace :v1 do
      resources :jobs do
        resources :contracts
      end
    end
  end
end
