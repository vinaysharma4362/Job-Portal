# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies do
    resources :job_posts do
      get 'view_candidates', on: :member
    end
  end
  get 'companies_dashboards/index'
  root 'dashboards#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users do
    resources :resumes
    resources :job_posts, only: %i[index show] do
      get 'apply_job', on: :member
      get 'apply_job_destroy', on: :member
    end
  end

  post 'job_posts/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
