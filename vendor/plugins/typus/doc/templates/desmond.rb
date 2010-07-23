=begin

Generate a Rails application with typus, typus_cms and typus_settings.

    $ rails new desmond -m http://github.com/fesplugas/typus/raw/3-0-unstable/doc/site/desmond.rb

Enjoy!

=end

##
# Install typus
##

answer = ask("Are you using Rails 3.0.0.beta4? (YES/no)").downcase
branch = (answer == "no" || answer == "n") ? "2-3-stable" : "3-0-unstable"

plugin "typus", :git => "git://github.com/fesplugas/typus.git -r #{branch}"
generate "typus"
generate "typus:migration"

##
# Install useful plugins
##

plugin "acts_as_list", :git => "git://github.com/rails/acts_as_list.git"
plugin "acts_as_tree", :git => "git://github.com/rails/acts_as_tree.git"
plugin "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

##
# Install typus extras only if user has access to trunksapp.com
##

answer = ask("Do you have access to trunksapp.com? (yes/NO)").downcase
extras = (answer == "yes" || answer == "y") ? true : false

if extras
  plugin "typus_cms", :git => "git@trunksapp.com:fesplugas/typus_cms.git"
  plugin "typus_settings", :git => "git@trunksapp.com:fesplugas/typus_settings.git"
  generate "typus_cms_migration"
  generate "typus_settings_migration"
end

##
# Migrate the database!
##

rake "db:migrate"
