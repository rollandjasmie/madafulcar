Rails.application.routes.draw do

#=================== HOME PAGE =========================#
  root "static_pages#home"
  #form search
  get '/search' => 'static_pages#search' , :as => 'search_car'
#=== UserLogin / sing_up /show_profil with avatars =====#
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users, only: [:index,:show] do
    resources :avatars , only: [:create]
  end
#===============  Add_new_car/Remove  ==================#
  resources :car  do
    resources :pictures , only: [:create]
    resources :likes
  end
#==============  Comment for cars  =====================#
  resources :comments
  resources :answers
#==  Link for private_messages (user <--> other_user) ==#
  resources :conversations do #contact list
    resources :messages #message content
  end
#=================  Abonnement  ========================#
resources :abonnement, only:[:index]
resources :premiums, only: [:create,:destroy]
resources :golds, only: [:create,:destroy]
#=======================================================#


# 404
  match '/404', to: 'errors#not_found', via: :all
end
