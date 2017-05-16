class MakersBnB < Sinatra::Base

  post '/users/new' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password])
                session[:user_id] = user.id
    redirect '/properties'
  end

  get '/properties' do
    @user = User.first
    erb :properties
  end

end
