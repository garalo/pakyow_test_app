class Dene
  include DataMapper::Resource
  
  property :id,          Serial # auto-increment integer key
  property :baslik,      String 
  property :icerik,      Text
  property :created_at,  DateTime
  property :time, Time   # I don`t know about this. Only datamapper need it. May be datamapper bug??
  
  belongs_to :user
  
end