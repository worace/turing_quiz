Rails.application.routes.draw do
  root to: "quizzes#index"

  resources :quizzes, only: [:show]

  namespace :admin do
    resources :quizzes do
      resources :questions, only: [:new, :create]
    end

    resources :questions, only: [:edit, :update, :destroy]
    resources :answers, only: [:edit, :update, :destroy]
    resources :hints, only: [:edit, :update, :destroy]
    resources :options, only: [:edit, :update, :destroy]
    resources :further_thoughts, only: [:edit, :update, :destroy]

    resources :questions, only: [] do
      resources :answers, only: [:new, :create]
      resources :hints, only: [:new, :create]
      resources :options, only: [:new, :create]
      resources :further_thoughts, only: [:new, :create]
    end
  end
end
