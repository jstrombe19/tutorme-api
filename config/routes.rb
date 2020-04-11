Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tutor_subjects
    end
  end
  namespace :api do
    namespace :v1 do
      resources :subjects
    end
  end
  namespace :api do
    namespace :v1 do
      resources :appointments
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  
  post "login", to: "api/v1/authentication#login"
  get "profile", to: "api/v1/users#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
