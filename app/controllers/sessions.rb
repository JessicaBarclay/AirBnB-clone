class MakersBnB < Sinatra::Base

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thank you for visiting MakersBnB"
    redirect '/'
  end

end
