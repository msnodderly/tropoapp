require 'rubygems'
require 'sinatra'
require 'crack'

require "digest/sha1"
require 'model'
require 'haml'
require "sinatra-authentication"
require "tropo-transcriptions"




# Configure DataMapper 
#DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "sqlite3://#{Dir.pwd}/driver.sqlite3")



get '/' do

"oh, hi there. this is the db url: #{ENV['DATABASE_URL'] ||  "sqlite3://#{ENV["PWD"]}/driver2.sqlite3"}"

end

get '/protected' do
login_required

"hi #{current_user.email}"

end
