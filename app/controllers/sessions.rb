class MakersBnB < Sinatra::Base

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thank you for visiting MakersBnB"
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/listing')
    else
      flash.now[:errors] = ['Invalid username or password']
      erb :'sessions/new'
    end
  end

  get '/sessions/listing/:name' do
    listing = Listing.first(:name => params[:name])
    session[:listing_id] = listing.id
    redirect to("/listing/#{params[:name]}")
  end

end
