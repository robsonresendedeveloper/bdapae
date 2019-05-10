Rails.application.routes.draw do
  resources :patients
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  get 'new_user', to: 'welcome#new_user'

  post 'save_user', to: 'welcome#save_user'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end
end
