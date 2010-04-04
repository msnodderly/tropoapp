require 'rubygems'
require 'sinatra'
require 'crack'

require "digest/sha1"
require 'model'
require "sinatra-authentication"
require "tropo-transcriptions"



use Rack::Session::Cookie, :secret => 'ok,, this is mTy sEcret phrASe tHa4 no0wn wille ver gu3ss-===r'



# Configure DataMapper 
#DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "sqlite3://#{Dir.pwd}/driver.sqlite3")



get '/' do

"oh, hi there. this is the db url: #{ENV['DATABASE_URL'] ||  "sqlite3://#{ENV["PWD"]}/driver.sqlite3"}"

end

get '/protected' do
login_required

"hi #{current_user.email}"

end
