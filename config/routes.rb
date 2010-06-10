ActionController::Routing::Routes.draw do |map|
  map.devise_for :users, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }

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

  map.namespace :client do |client|
    client.resources :ads, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :news, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :users, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :offers, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :messages, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :pictures, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :housings, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :bathrooms, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :calendars, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :reservations, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :organizations, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
    client.resources :message_usergroups, :path_prefix => ":locale", :requirements => { :locale => /(fr)|(en)/ }
  end

  map.namespace :member do |member|
    member.resources :ads
  end
  
  map.namespace :admin do |admin|
    admin.resources :ads
  end


  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :namespace => 'client', :controller => "pages", :locale => "fr", :requirements => { :locale => /(fr)|(en)/ }
  
  map.client 'client', :namespace => 'client', :controller => 'pages'
  map.member 'member', :namespace => 'member', :controller => 'ads'
  map.admin 'admin', :namespace => 'admin', :controller => 'ads'

  map.connect ":locale", :controller => "pages", :requirements => { :locale => /(fr)|(en)/ }
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':locale/:controller/:action/:id', :requirements => { :locale => /(fr)|(en)/ } 
  map.connect ':locale/:controller/:action/:id.:format', :requirements => { :locale => /(fr)|(en)/ } 
end
