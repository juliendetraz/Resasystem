ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.namespace :client, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ } do |client|
    client.devise_for :client_user, :scope => :client, :path_prefix => 'client', :as => 'client', :class_name => 'User', :controllers => { :sessions => 'sessions' }
    client.resources :ads
    client.resources :news
    client.resources :users
    client.resources :offers
    client.resources :messages
    client.resources :pictures
    client.resources :housings
    client.resources :bathrooms
    client.resources :calendars
    client.resources :reservations
    client.resources :organizations
    client.resources :message_usergroups
  end

  map.namespace :member, :path_prefix => ":locale/member", :requirements => { :locale => /(fr)|(en)/ } do |member|
    member.devise_for :member_user, :as => 'users', :class_name => 'User', :controllers => { :sessions => "member/sessions" }
    member.resources :ads
    member.resources :news
    member.resources :users
    member.resources :offers
    member.resources :messages
    member.resources :pictures
    member.resources :housings
    member.resources :bathrooms
    member.resources :calendars
    member.resources :reservations
    member.resources :organizations
    member.resources :message_usergroups
  end
  
  map.namespace :admin, :path_prefix => ":locale/admin", :requirements => { :locale => /(fr)|(en)/ } do |admin|
    admin.devise_for :admin_user, :as => 'users', :class_name => 'User', :controllers => { :sessions => "admin/sessions" }
    admin.resources :ads
    admin.resources :news
    admin.resources :users
    admin.resources :offers
    admin.resources :messages
    admin.resources :pictures
    admin.resources :housings
    admin.resources :bathrooms
    admin.resources :calendars
    admin.resources :reservations
    admin.resources :organizations
    admin.resources :message_usergroups
  end


  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :namespace => 'client', :controller => "pages", :locale => "fr", :requirements => { :locale => /(fr)|(en)/ }
  
  map.client 'client', :namespace => 'client', :controller => 'pages'
  map.member 'member', :namespace => 'member', :controller => 'users', :action => 'profile'
  map.admin 'admin', :namespace => 'admin', :controller => 'ads'

  map.connect ":locale", :controller => "pages", :requirements => { :locale => /(fr)|(en)/ }
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':locale/:controller/:action/:id', :requirements => { :locale => /(fr)|(en)/ } 
  map.connect ':locale/:controller/:action/:id.:format', :requirements => { :locale => /(fr)|(en)/ } 
end
