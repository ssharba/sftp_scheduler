Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :client, only: [:create] do
          collection do
            post :upload_to_aws
          end
       end
    end
  end
end
