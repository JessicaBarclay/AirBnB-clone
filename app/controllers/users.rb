class MakersBnB < Sinatra::Base

  post '/users/new' do
    user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash.now[:notice] = 'Passwords do not match'
      erb :index
    end
  end

  get '/users/new' do
    erb :index
  end

  get '/listings' do
    erb :listings
  end

end
