# frozen_string_literal: true

# routes
Rails.application.routes.draw do
  get 'companies_dashboards/index'
  devise_for :companies, controllers: {
    sessions: 'companies/sessions'
  }
  root 'dashboards#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
