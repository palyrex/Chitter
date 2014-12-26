require 'data_mapper'
require 'sinatra/base'
require 'sinatra/partial'
require 'haml'
require 'rack-flash'

require_relative "controllers/sessions"
require_relative "controllers/users"
require_relative "helpers/application_helper"
require_relative "datamapper_setup"


class Chitter < Sinatra::Base

  enable :sessions

  use Rack::Flash
  use Rack::MethodOverride

  set :views, File.join(root, "..", "views") 

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :haml
  end

  configure :production do
    set :haml, { :ugly=>true }
  end

  configure :development do
    set :haml, { :ugly=>true }
  end

  get '/' do
    haml :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
