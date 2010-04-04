require 'rubygems'
require 'sinatra'
require 'crack'
require 'dm-core'


# Configure DataMapper to use the App Engine datastore 
#DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "sqlite3://#{Dir.pwd}/tropo.sqlite3")



get '/transcriptions' do
 login_required
  # Just list all the shouts
  @transcriptions = VoxeoTranscription.all

  erb :index
end

get '/transcription' do
  login_required
  # Just list all the shouts
  @transcription = VoxeoTranscription.first(:guid => params[:guid])
  erb :single
end


# obscure post url a little
post '/receive_transcription654' do
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


