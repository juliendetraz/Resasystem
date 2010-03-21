# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_www.resasystem.com_session',
  :secret      => '1157301fdb5c92cc7897dd26ba7aaa49d6c2bcab95018284565c26187637bfbea67fe812ce800506f9362864fc674afaedbbbc99b20cca86ce86691f363c965d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
