class MakersBnB < Sinatra::Base

  post '/users/new' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/listing'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :index
    end
  end

  get '/users/new' do
    erb :index
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    "Your token is expired"
  end

end
