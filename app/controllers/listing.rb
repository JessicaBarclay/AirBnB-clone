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
    user = current_user
    listing.user << user
    p listing.user
    listing.save
    p listing.user
    redirect '/listing'
  end

  # problem adding user to the listing, check the user object in an rspec test

end
