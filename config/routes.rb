Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  delete ':id/unsubscribe' => 'sessions#unsubscribe', as: :unsubscribe
  root "home#index"
end
