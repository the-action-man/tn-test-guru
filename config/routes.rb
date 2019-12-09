Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/new'

  root to: 'tests#index'

  get :signup, to: 'users#new'
  resources :users, only: %i[create]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: %i[index show]
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
