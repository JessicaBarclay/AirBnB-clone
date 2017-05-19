require_relative '../data_mapper_setup'
require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :requestfrom, Date
  property :requestuntil, Date

end
