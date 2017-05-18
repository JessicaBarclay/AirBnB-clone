require_relative '../data_mapper_setup'

class Listing

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Numeric

  belongs_to :user

end
