class MakersBnB < Sinatra::Base

  post '/request/new' do
    Request.create(requestfrom: params[:requestfrom],
                   requestuntil: params[:requestuntil])
  end

end
