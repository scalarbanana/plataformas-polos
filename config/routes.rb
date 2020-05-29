# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cartografias
  resources :tecituras

  scope :uploads, format: false do
    get 'reports/*rest', to: 'downloads#report'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, format: false
  resources :users

  get '/', to: 'dashboard#index'
  root to: 'dashboard#index'
end
