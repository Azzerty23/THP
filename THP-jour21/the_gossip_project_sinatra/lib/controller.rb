require 'gossip'
require 'comment'

class ApplicationController < Sinatra::Base

  get '/' do
    redirect '/welcome'
  end

  get '/welcome' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect back
    # erb :thanks
  end

  get '/gossips/:id' do
    puts "VOICI L'ID DU GOSSIP : #{params["id"]}"
    erb :show, locals: {gossip: Gossip.find(params["id"]), comments: Comment.all}
  end

  post '/gossips/:id' do
    Comment.new(params["comment_author"], params["comment_content"], params["id"].to_i).save
    redirect back
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {gossip: Gossip.find(params["id"])}
  end

  post '/gossips/:id/edit' do
    Gossip.update(params["id"], params["gossip_author"], params["gossip_content"])
    redirect back
  end

end