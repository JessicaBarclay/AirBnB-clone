ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/send_recovery_link'
require_relative 'models/user'
require_relative 'models/listing'
require_relative 'models/request'
require_relative 'controllers/users'
require_relative 'controllers/listing'
require_relative 'controllers/request'
require_relative 'controllers/sessions'
require_relative './server'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

end
