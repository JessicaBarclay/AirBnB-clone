ENV['RACK_ENV'] ||= 'development'

require  'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'
#require_relative 'controllers/user'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/user' do
    User.create(email: params[:email],
             username: params[:username],
             password: params[:password])
  end

end
