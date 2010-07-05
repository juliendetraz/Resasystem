Resasystem::Application.routes.draw do
  # I18n.available_locales is set in config/initializers/locale.rb
  scope ':locale', :constraints => { :locale => /(#{I18n.available_locales.join(')|(')})/ } do
#    localized(I18n.available_locales, :verbose => true) do
      # The priority is based upon order of creation:
      # first created -> highest priority.

      # Sample of regular route:
      #   match 'products/:id' => 'catalog#view'
      # Keep in mind you can assign values other than :controller and :action

      # Sample of named route:
      #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
      # This route can be invoked with purchase_url(:id => product.id)

      # Sample resource route (maps HTTP verbs to controller actions automatically):
      #   resources :products

      # Sample resource route with options:
      #   resources :products do
      #     member do
      #       get :short
      #       post :toggle
      #     end
      #
      #     collection do
      #       get :sold
      #     end
      #   end

      # Sample resource route with sub-resources:
      #   resources :products do
      #     resources :comments, :sales
      #     resource :seller
      #   end

      # Sample resource route with more complex sub-resources
      #   resources :products do
      #     resources :comments
      #     resources :sales do
      #       get :recent, :on => :collection
      #     end
      #   end

      # Sample resource route within a namespace:
      #   namespace :admin do
      #     # Directs /admin/products/* to Admin::ProductsController
      #     # (app/controllers/admin/products_controller.rb)
      #     resources :products
      #   end

      #scope '', :module => :client do # /locale:/client_controller#action
      namespace :client do # /locale:/client/client_controller#action
        devise_for :cusers, :path => 'users', :class_name => 'User'
        resources :ads
        resources :users
        resources :news
        resources :offers
        resources :messages
        resources :pictures
        resources :rooms
        resources :housings do
          resources :rooms
        end
        resources :bathrooms
        resources :calendars
        resources :reservations
        resources :organizations
        resources :message_usergroups
        root :to => 'pages#index'
      end # namespace :client

#      namespace :admin do
#        devise_for :ausers, :path => 'users', :class_name => 'User'
#        resources :ads
#        resources :users
#        resources :news
#        resources :offers
#        resources :messages
#        resources :pictures
#        resources :rooms
#        resources :housings do
#          resources :rooms
#        end
#        resources :bathrooms
#        resources :calendars
#        resources :reservations
#        resources :organizations
#        resources :message_usergroups
#        root :to => 'pages#index'
#      end # namespace :admin
#
      namespace :member do
        devise_for :musers, :path => 'users', :class_name => 'User'
        resources :ads
        resources :users
        resources :news
        resources :offers
        resources :messages
        resources :pictures
        resources :rooms
        resources :housings do
          resources :rooms
        end
        resources :bathrooms
        resources :calendars
        resources :reservations
        resources :organizations
        resources :message_usergroups
        root :to => 'pages#index'
      end # namespace :member
#    end # localized

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    # root :to => "welcome#index"

    # See how all your routes lay out with "rake routes"

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id(.:format)))'
    match ':controller(/:action(/:id(.:format)))'
  end # scope :locale
  root :to => 'client/pages#index', :locale => "fr"
end # routes
