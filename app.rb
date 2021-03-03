require 'sinatra/base'
require './setup_database_connection'
require './lib/space.rb'
require './lib/user.rb'
require 'sinatra/flash'

class MakersBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @current_user = session[:user_id]
  end

  get '/' do
    erb(:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/index')
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  post '/spaces/new' do
    Space.create(name: params['name'], description: params['description'], price: params['price'], user_id: session[:user_id] )
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
    flash[:successful_signup] = "Welcome to Makers BnB, #{user.name}!"
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/users/success' do
    erb(:'users/success')
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  get '/sessions/success' do
    erb(:'/sessions/success')
  end

  post '/sessions/new' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      flash[:successful_login] = "You have successfully logged in, #{user.name}"
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:unsuccessful_login] = "I'm sorry, those details don't match our records"
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end
