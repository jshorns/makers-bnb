require 'sinatra/base'

class MakersBNB < Sinatra::Base

  get '/' do
    "hello wordle!"
  end

  run! if app_file == $0
end
