class MakersBnB < Sinatra::Base

  get '/listings' do
    erb :listings
  end

  get '/listings/new' do
    erb :new_listings
  end

  post '/listings/new' do
    Listings.create(name: params[:name],
                    description: params[:description],
                    price: params[:price],
                    from: params[:from],
                    to: params[:to])
    redirect '/listings'
  end

end
