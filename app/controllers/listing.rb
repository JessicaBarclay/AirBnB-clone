class MakersBnB < Sinatra::Base

  get '/listing' do
    @listings = Listing.all
    erb :listing
  end

  get '/listing/new' do
    erb :new_listing
  end

  post '/listing/new' do
    Listing.create(name: params[:name],
                    description: params[:description],
                    price: params[:price])
    redirect '/listing'
  end

end
