require_relative '../data_mapper_setup'

class Listings

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Numeric
  property :from, Date
  property :to, Date

end
