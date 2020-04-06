# frozen_string_literal: true

# Routes of project
Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions'
  }
  resources :companies do
    resources :reviews
    resources :job_posts do
      get 'view_candidates', on: :member
    end
  end
  get 'admin_dashboard/index'
  get 'companies_dashboards/index'
  root 'dashboards#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users  do
    resources :resumes
    resources :job_posts, only: %i[index show] do
      member do
        get 'apply_job'
        get 'apply_job_destroy'
      end
    end
  end

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  authenticated :user do
    
  end

  post 'job_posts/search'
end
