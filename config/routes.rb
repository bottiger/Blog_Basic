BlogBasic::Engine.routes.draw do
#Rails::Application.routes.draw do
#match '*' => 'tag#test'
#resources :blog_posts do 
resources :blog_posts, :path => '' do
##        posts :as => :wrote
#
		resources :blog_comments
		resources :blog_images
#		
		collection do
			get :drafts
		end
#		
#		#member do
		#	get :tag
		#end
end
    match '/test' => 'tag#test'
#    match 'tag/:tag' => 'tag#show', :as => 'tag'
    resources :tags

    #fix - include in namespace
    match "/auth/:provider/callback" => "sessions#create"
    
    match '/signin' => 'session#create', :defaults => { :provider => "github" }
    match "/signout" => "sessions#destroy", :as => :signout
end
