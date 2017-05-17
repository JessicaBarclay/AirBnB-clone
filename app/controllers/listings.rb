class MakersBnB < Sinatra::Base

  get '/listings' do
    erb :listings
  end

  post '/listings/new' do
    Listings.create(name: params[:name],
                    description: params[:description],
                    price: params[:price],
                    from: params[:from],
                    to: params[:to])
  end

end
