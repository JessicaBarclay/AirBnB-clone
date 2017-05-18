require_relative '../data_mapper_setup'
require 'date'

class Listing

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Numeric
  property :available_from, Date
  property :available_to, Date

  belongs_to :user

end
