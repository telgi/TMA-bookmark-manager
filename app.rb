require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:links)
  end

  run! if app_file == $0
end
