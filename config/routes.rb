Rails.application.routes.draw do
  
  #Userモデルのルーティング
  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/new', to: 'users#new'
  post 'users/new',to: 'users#create'
  post 'users/:id',to: 'users#update'
  delete 'signout', to: 'devise/sessions#destroy'
  get '/users/kakunin/:id' => 'users#kakunin'

  resources :users do
    resources :orders , only: :kakunin
  end
  
  
    #Roomモデルのルーティング
    get 'rooms/index',to: 'rooms#index'
    get 'rooms/new',to: 'rooms#new'
    post 'rooms/new',to: 'rooms#create'

    resources :rooms do
      collection do
        get :search
        get :result
        end
      end
    
    resources :rooms

    resources :rooms, :only => [:show, :edit]

    #reservasionモデルのルーティング
    get 'rooms/:id' => 'reservations#new'
    post 'rooms/:id' => 'reservations#create'
    
    

    resources :reservasions


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
