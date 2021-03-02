require 'sinatra/base'

class MakersBNB < Sinatra::Base

  get '/' do
    erb(:index)
    #test
  end

  run! if app_file == $0
end
