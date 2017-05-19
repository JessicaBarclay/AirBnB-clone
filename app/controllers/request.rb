class MakersBnB < Sinatra::Base

  post '/request/new/' do
    request = Request.new(requestfrom: params[:requestfrom],
    requestuntil: params[:requestuntil])
    listing = current_listing
    request.user = current_user
    request.listing = listing

    if !request.user
      flash[:errors] = ['You must be logged in to make a request']
      redirect '/'
    else
      request.save
      redirect '/requests'
    end
  end
end
