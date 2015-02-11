Rails.application.routes.draw do
  root to: "quizzes#index"

  resources :quizzes do
    resources :questions, only: [:new, :create]
  end
  resources :questions, only: [:edit, :update, :destroy]
  resources :answers, only: [:edit, :update, :destroy]

  resources :questions, only: [] do
    resources :answers, only: [:new, :create]
    resources :options
    resources :hints
    resources :further_thoughts
  end
end
