# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_1stproject_session',
  :secret      => 'acc89f4a65e1c269c9d36ab8145ad0a97e326f25abd2fe3956000b0ff7863895b7aaff9bd09620cbd79833178cf91cb9c31fa37def195139601fedcdd0d02b9a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
