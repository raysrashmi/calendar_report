Rails.application.routes.draw do
  get '/auth/google_oauth2/callback' => 'sessions#create'
  root "home#index"
end
