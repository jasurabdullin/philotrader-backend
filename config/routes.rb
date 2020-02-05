Rails.application.routes.draw do
  resources :users
  resources :stocks
  post '/stocks/search', to: 'stocks#search'
  post '/stocks/profile', to: 'stocks#profile'
end
