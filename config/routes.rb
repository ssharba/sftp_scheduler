Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :client, only: [:create]
    end
  end
end
