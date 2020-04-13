# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'dashboard#index'

  devise_for :users

  root to: 'dashboard#index'
end
