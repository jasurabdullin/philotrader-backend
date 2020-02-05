Rails.application.routes.draw do
  resources :users
  resources :stocks
  post '/stocks/search', to: 'stocks#search'
end
