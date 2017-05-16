class MakersBnB << Sessions::Base
  enable :sessions
  set :session_secret, 'super secret'
end
