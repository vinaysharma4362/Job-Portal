# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies do
    resources :job_posts
    resources :apply_jobs
  end
  get 'companies_dashboards/index'
  root 'dashboards#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users do
    resources :resumes
    resources :job_posts do 
      resources :apply_jobs
      get 'job_post_apply', on: :member
    end
  end

  get 'job_posts/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
