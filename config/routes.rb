Rails.application.routes.draw do
  root 'application#page_not_found'

  get 'beer_tenders' => 'beer_tenders#index'
  get 'beer_tenders/:id' => 'beer_tenders#show'

  get 'users' => 'users#index'
  post 'users' => 'users#register'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/push' => 'users#push'
end
