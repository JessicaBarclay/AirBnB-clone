require_relative '../data_mapper_setup'

class Listing

  include DataMapper::Resource

  has n, :user, through: Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Numeric

end
