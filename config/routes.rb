Rails.application.routes.draw do
  resources :patients
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end
end
