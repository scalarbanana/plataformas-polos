# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, format: false

  get '/', to: 'dashboard#index'
  resources :users

  root to: 'dashboard#index'
end
