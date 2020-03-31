# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies do
    resources :job_posts
  end
  get 'companies_dashboards/index'
  root 'dashboards#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users do
    resources :resumes
  end

  get 'job_posts/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
