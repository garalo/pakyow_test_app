class Post
  include DataMapper::Resource
  attr_accessor :id
  
  property :id,          Serial # auto-increment integer key
  property :name,        String 
  property :content,     Text
  property :time, Time # I don`t know about this. Only datamapper need it. May be datamapper bug??
  
  belongs_to :user
  has_tags :tags  
end
