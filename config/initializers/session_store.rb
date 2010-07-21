# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, :key => '_resasystem_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Rails.application.config.session_store :active_record_store

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
#ActionController::Base.session = {
#  :key         => '_resasystem_session',
#  :secret      => '61555e424163617027332251227d667534687c6a304c3d5f6d6f2b577e426127436b4f5264562d29337e405e5430647023634e363d63573b474a686657675c71'
#}

#
# http://thewebfellas.com/blog/2008/12/22/flash-uploaders-rails-cookie-based-sessions-and-csrf-rack-middleware-to-the-rescue
#
# Also see app/middleware/flash_session_cookie_middleware.rb
#
Rails.application.config.middleware.insert_before(
  ActionDispatch::Session::CookieStore,
  FlashSessionCookieMiddleware,
  Rails.application.config.session_options[:key]
)
