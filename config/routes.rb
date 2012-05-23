BlogBasic::Engine.routes.draw do

#    ActiveAdmin.routes(self)
##    devise_for :admin_users, ActiveAdmin::Devise.config

  resources :blog_posts, :path => '' do
    resources :blog_comments
    resources :blog_images

    collection do
      get :drafts
    end
  end
  resources :tags

  #fix - include in namespace
  match "/auth/:provider/callback" => "sessions#create"

  match '/signin' => 'session#create', :defaults => { :provider => "github" }
  match "/signout" => "sessions#destroy", :as => :signout
end
