require 'sinatra/base'
require 'erb'
require 'creole'

class App < Sinatra::Base

  set :project_title, "Typus"
  set :title, "Typus Documentation"

  get '/*' do
    splat = params[:splat].delete_if { |x| x.empty? }
    page = splat.empty? ? 'README.creole' : params[:splat].join("/")
    data = File.read("data/#{page}")
    @title = (page == 'README') ? 'Index' : page.capitalize
    @page = Creole.new(data).to_html
    erb :index
  end

end
