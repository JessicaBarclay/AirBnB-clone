class MakersBnB < Sinatra::Base

  get '/listing' do
    @listings = Listing.all
    erb :listing
  end

  get '/listing/new' do
    erb :new_listing
  end

  post '/listing/new' do
    listing = Listing.new(name: params[:name],
                    description: params[:description],
                    price: params[:price])

    listing.user = current_user
    listing.save
    redirect '/listing'
  end
end
