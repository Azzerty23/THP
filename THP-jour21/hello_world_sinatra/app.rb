system 'Bundler install --quiet'
require 'bundler'
Bundler.require

get '/' do
  '<h1> Hello world ! </h1>'
end

get '/bonjour' do
  '<h1>Bonjour, monde !</h1>'
end