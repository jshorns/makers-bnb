require 'sinatra/base'
require './setup_database_connection'
require './lib/space.rb'
require './lib/user.rb'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
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
    session[:user] = user
    redirect '/users/success'
  end

  get '/users/success' do
    erb(:'users/success')
  end

  run! if app_file == $0
end
