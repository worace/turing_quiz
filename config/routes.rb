Rails.application.routes.draw do
  resources :questions

  root to: "quizzes#index"

  resources :quizzes do
    resources :questions do
      resources :answers
      resources :options
      resources :hints
      resources :further_thoughts
    end
  end
end
