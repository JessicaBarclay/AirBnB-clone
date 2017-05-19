class MakersBnB < Sinatra::Base

  post '/request/new' do
    request = Request.new(requestfrom: params[:requestfrom],
    requestuntil: params[:requestuntil])

    request.user = current_user

    if !request.user
      flash[:errors] = ['You must be logged in to make a request']
      redirect '/'
    else
      request.save
      #redirect '/listing'
    end
  end
end
