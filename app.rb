require 'sinatra/base'
require './setup_database_connection'
require './lib/calendar.rb'
require './lib/space.rb'
require './lib/spacedate.rb'
require './lib/user.rb'
require './lib/booking_request.rb'
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

  get '/spaces/new/:id' do
    @spaces = Space.find_by_user_id(id: @current_user)
    if @current_user
      erb(:'spaces/new')
    else
    flash[:no_user] = "You must be signed in to do that"
    redirect('/')
    end
  end

  get '/spaces/:space_id' do
    @space = Space.find_by_id(id: params[:space_id])
    erb(:'spaces/details')
  end

  get '/spaces/:space_id/requests/new/:date_id' do
    @space = Space.find_by_id(id: params[:space_id])
    @date = SpaceDate.find_by_id(id: params[:date_id])
    erb(:'requests/new')
  end

  post '/spaces/:space_id/requests/new/:date_id' do
    @space = Space.find_by_id(id: params[:space_id])
    @date = SpaceDate.find_by_id(id: params[:date_id])
    BookingRequest.create(space_id: @space.id, date_id: @date.id, customer_id: @current_user, landlord_id: @space.user_id)
    flash[:booking_success] = "Your booking request for #{@space.name} on #{@date.date} has been made."
    redirect('/spaces')
  end

  get '/spaces/:space_id/calendar/new' do
    @space = Space.find_by_id(id: params[:space_id])
    if @current_user == @space.user_id
      erb(:'spaces/calendar/new')
    else
      flash[:not_owner] = "You must be the owner of a property to add available dates."
      redirect("/spaces/#{@space.id}")
    end
  end

  post '/spaces/:space_id/calendar/new' do
    @space = Space.find_by_id(id: params[:space_id])
    Calendar.create(space_id: @space.id, start_date: params['start_date'], end_date: params['end_date'])
    redirect("/spaces/#{@space.id}")
  end

  post '/spaces/new' do
    space = Space.create(name: params['name'], description: params['description'], price: params['price'], user_id: session[:user_id] )
    Calendar.create(space_id: space.id, start_date: params['start_date'], end_date: params['end_date'])
    redirect '/spaces'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    email_check = User.checking_email(email: params[:email])
    user_name = User.checking_username(username: params[:username])
    if email_check == :failure
      flash[:duplicate_email] = 'Sorry, that email address is already being used.'
      redirect '/users/new'
    elsif user_name == :failure
      flash[:duplicate_username] = 'Sorry, that username is already being used.'
      redirect '/users/new'
    else
      user = User.create(
        name:     params[:name],
        password: params[:password],
        email:    params[:email],
        username: params[:username]
      )
      flash[:successful_signup] = "Welcome to Makers BnB, #{user.name}!"
      session[:user_id] = user.id
      redirect '/spaces'
    end
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

  post '/sessions/destroy' do
    session.clear
    flash[:logout] = "You have successfully logged out. Goodbye!"
    redirect('/')
  end

  get '/requests' do
    @requests = BookingRequest.all_by_landlord_id(landlord_id: @current_user)
    @customer_requests = BookingRequest.all_by_customer_id(customer_id: @current_user)
    erb(:'requests/index')
  end

  run! if app_file == $0
end
