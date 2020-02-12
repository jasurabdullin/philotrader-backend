Rails.application.routes.draw do
  resources :watchlists
  resources :users, only: [:create, :index] 
  resources :stocks
  post '/stocks/search', to: 'stocks#search'
  post '/stocks/profile', to: 'stocks#profile'
  post 'stocks/historical_price', to: 'stocks#historical_price'
  post 'stocks/income_statement', to: 'stocks#income_statement'
  post 'stocks/balance_sheet', to: 'stocks#balance_sheet'
  post 'stocks/news', to: 'stocks#news'
  get '/users/login', to: 'users#login', as: 'login'

  delete '/watchlists/delete', to: 'watchlists#destroy'
end
