require 'rubygems'
require 'sinatra'
require 'crack'
require 'dm-core'


# Configure DataMapper to use the App Engine datastore 
#DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "sqlite3://#{Dir.pwd}/tropo.sqlite3")



# Create your model class
class VoxeoTranscription
  include DataMapper::Resource
  
  property :id, Serial
  property :guid, String
  property :identifier, String
  property :message, Text
end

DataMapper.auto_upgrade!


get '/transcriptions' do
  # Just list all the shouts
  @transcriptions = VoxeoTranscription.all

  erb :index
end

get '/transcription' do
  # Just list all the shouts
  @transcription = VoxeoTranscription.first(:guid => params[:guid])
  erb :single
end


post '/receive_transcription' do
  begin 
    result = Crack::XML.parse env['rack.request.form_hash'].to_s
  rescue 
    result = Crack::JSON.parse env['rack.request.form_hash'].to_s
  end

  # Create a new shout and redirect back to the list.
  shout = VoxeoTranscription.create(:guid       => result['result']['guid'],
                                     :identifier => result['result']['identifier'],
                                     :message    => result['result']['transcription'])
end


