ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/listings'
require_relative 'controllers/users'
require_relative 'controllers/listings'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

end
