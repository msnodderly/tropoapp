require 'datamapper'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'fileutils'





# Configure DataMapper 
DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "sqlite3://#{Dir.pwd}/driver2.sqlite3")


# Create your model class
class VoxeoTranscription
  include DataMapper::Resource
  
  property :id, Serial
  property :guid, String
  property :identifier, String
  property :message, Text
end

DataMapper.auto_upgrade!

