require('sinatra')
require('sinatra/reloader')
require('pg')
require('./lib/museum')
require('./lib/artwork')
also_reload('/lib/**/*.rb')

DB = PG.connect(:dbname => 'museum_tracker')

get('/') do
  erb(:index)
end

get('/museums') do
  @museums = Museum.all()
  erb(:museums)
end

post('/museums') do
  name = params.fetch('name')
  musuem = Museum.new({:name => name})
  museum.save()
  redirect back
end

get('/artworks') do
  @artworks = Artwork.all()
  erb(:artworks)
end


