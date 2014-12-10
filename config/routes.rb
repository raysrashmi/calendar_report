Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  root "home#index"
end
