require 'rubygems'
require 'sinatra'
require 'crack'
require 'rack-flash'

require "digest/sha1"
require 'model'
require 'haml'
require "sinatra-authentication"
require "tropo-transcriptions"



use Rack::Session::Cookie, :secret => 'ok,, this is mTy sEcret phrASe tHa4 no0wn wille ver gu3ss-===r'

#enable :sessions
use Rack::Flash

get '/' do

"oh, hi there. this is the db url: #{ENV['DATABASE_URL'] ||  "sqlite3://#{ENV["PWD"]}/driver2.sqlite3"}"

end

get '/protected' do
login_required
flash[:notice] = "Thanks for signing in!"

     # Get a flash entry
flash[:notice] # => "Thanks for signing up!"
#

"hi #{current_user.email}"

end
