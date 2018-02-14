require 'sinatra/base'
require './lib/link'
require './spec/database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/add_link' do
    Link.add(url: params['url'])
    redirect '/links'
  end

  run! if app_file == $0
end
