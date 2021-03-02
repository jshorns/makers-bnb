require 'sinatra/base'
require './setup_database_connection'
require './lib/space.rb'
require './lib/user.rb'

class MakersBNB < Sinatra::Base
  enable :sessions

  before do
    @current_user = session[:user_id]
  end

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
    Spaces.create(name: params['name'], description: params['description'], price: params['price'], user_id: session[:user_id] )
    redirect '/spaces'
  end
  
  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    user = User.create(
      name: params[:name],
      password: params[:password],
      email: params[:email],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/users/success'
  end

  get '/users/success' do
    erb(:'users/success')
  end

  run! if app_file == $0
end
