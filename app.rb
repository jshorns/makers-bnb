require 'sinatra/base'
require './setup_database_connection'
require './lib/space.rb'
require './lib/db_connection'

class MakersBNB < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
  end

  get '/spaces/new' do 
    erb(:newspace)
  end 

  post 'spaces/new' do 
    Spaces.create(name: params['name'], description: params['description'], price: params['price'], user_id: params['user_id'] )
    redirect '/spaces'
  end

  run! if app_file == $0
end
