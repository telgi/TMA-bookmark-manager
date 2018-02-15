require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './spec/database_connection_setup'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash

  enable :sessions

  get '/' do
    @links = Link.all
    flash[:warning] = 'Hooray, Dan sucks!'
    erb(:index)
  end

  post '/add_link' do
    Link.add(params[:url])
    redirect '/'
  end

  run! if app_file == $0
end
