class Bir
  include DataMapper::Resource

  property :firstname, String
  property :lastname, String, :key => true
  #property :email, String, :key => true
end