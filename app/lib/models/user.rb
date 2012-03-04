require 'pakyow-auth'

class User < Pakyow::Auth::User
  #include DataMapper::Resource
  attr_reader :posts, :denes, :email
  has n, :posts
  #has n, :posts, :through => Resource
  has n, :denes

  property :email, String
  
  
   #INSERT INTO "users" VALUES ("1","7887955ccf84bfc33118b43d9db5d864ca0439bf","4f26ec2bd8390243b0ef7975938a72e8023d45cf","ahmedkilic@gmail.com");
end
