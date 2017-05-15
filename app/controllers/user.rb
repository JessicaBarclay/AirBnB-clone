
class MakersBnB < Sinatra::Base

  post '/user' do
    User.create(email: params[:email],
             username: params[:username],
             password: params[:password])

  end

end
