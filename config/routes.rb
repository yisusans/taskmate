Rails.application.routes.draw do

  root 'welcome#index'

  post 'accept' => 'invites#accept'
  get 'user_groups' => 'groups#user_groups'
  get 'members' => 'groups#members'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, only: [:index,:show]
  resources :assignments, except: [:edit, :update]
  resources :completions, except: [:edit, :update]
  resources :memberships, only: :destroy
  resources :groups, except: [:index, :update, :edit]
  resources :tasks, except: [:update, :edit]
  resources :welcome, only: :index
  resources :invites, except: [:index, :edit, :update]

  resources :conversations, only: [:create, :show] do
    resources :messages, only: :create
  end

end
