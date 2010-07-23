module Typus

  class Routes

    # In your application's config/routes.rb, draw Typus's routes:
    #
    # @example
    #   map.resources :posts
    #   Typus::Routes.draw(map)
    #
    # If you need to override a Typus route, invoke your app route
    # earlier in the file so Rails' router short-circuits when it finds
    # your route:
    #
    # @example
    #   map.resources :users, :only => [:new, :create]
    #   Typus::Routes.draw(map)
    def self.draw(map)

      map.resource :admin, :only => [:show], :controller => "admin" do |m|
        m.resources :account, :only => [:new, :create, :show], 
                                :controller => "account", 
                                :collection => { :forgot_password => :get }, 
                                :controller => "admin/account"
        m.resource :session, :only => [:new, :create, :destroy], :controller => "admin/session"
        m.resource :dashboard, :only => [:show], :controller => "admin/dashboard"
      end

      map.connect ":controller/:action/:id", :controller => /admin\/\w+/
      map.connect ":controller/:action/:id.:format", :controller => /admin\/\w+/

    end

  end

end
