ENV['RACK_ENV'] ||= 'dev'

require  'sinatra/base'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

end
