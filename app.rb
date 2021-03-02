require 'sinatra/base'
require './setup_database_connection'
require './lib/space.rb'

class MakersBNB < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
  end

  run! if app_file == $0
end
