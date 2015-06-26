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

get('/artworks') do
  @artworks = Artwork.all()
  erb(:artworks)
end

get('/museum') do
  @museums = Museum.all()
  erb(:museum)
end

post('/museum') do
  name = params.fetch('name')
  museum_id = params.fetch('museum_id').to_i()
  artwork = Artwork.new({:name => name, :museum_id => museum_id})
  artwork.save()
  @museum = Museum.find(museum_id)
  redirect back
end

get('/museums/:id') do
  @museum = Museum.find(params.fetch('id').to_i())
  erb(:museum)
end


