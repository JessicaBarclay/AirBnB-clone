class MakersBnB < Sinatra::Base

  post '/users/new' do
    User.create(email: params[:email],
                username: params[:username],
                password: params[:password])
  end

end
