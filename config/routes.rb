# frozen_string_literal: true

Rails.application.routes.draw do
  resources :examples, except: %i[new edit]
  resources :matrix, only: :index
  resources :users, only: %i[index show update]

  # AuthN routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  patch '/matrix' => 'matrix#update'
end
