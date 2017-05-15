require_relative '../data_mapper_setup.rb'

class User

    include DataMapper::Resource

    property :id, Serial
    property :email, String
    property :username, String
    property :password, String

end
