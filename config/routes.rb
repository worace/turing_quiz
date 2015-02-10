Rails.application.routes.draw do
  resources :quizzes do
    resources :questions do
      resources :answers
      resources :options
      resources :hints
      resources :further_thoughts
    end
  end
end
