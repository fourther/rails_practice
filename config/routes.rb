Rails.application.routes.draw do
  namespace :staff, path: '' do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
    # get 'staff_members' => 'staff_members#index'
    # get 'staff_members/:id' => 'staff_members#show'
    # get 'staff_members/new' => 'staff_members#new'
    # get 'staff_members/:id/edit' => 'staff_members#edit'
    # post 'staff_members' => 'staff_members#create'
    # patch 'staff_members/:id' => 'staff_members#update'
    # delete 'staff_members/:id' => 'staff_members#destroy'
    resources :staff_members
  end

  namespace :customer do
    root 'top#index'
  end

  root 'errors#not_found'
  get '*anything' => 'errors#routing_error'
end