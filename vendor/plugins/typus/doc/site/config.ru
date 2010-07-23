# This hack is to make application work on Dreamhost as they don't have sinatra
# installed.
ENV['GEM_PATH'] = '/home/fesplugas/.rvm/gems/ruby-1.8.7-p299'
require 'rubygems'
Gem.clear_paths

require 'app'

use Rack::ShowExceptions
run App.new
