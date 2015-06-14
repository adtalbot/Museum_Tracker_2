class Artwork
  attr_reader(:name, :museum_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @museum_id = attributes.fetch(:museum_id).to_i()
  end
  
  define_singleton_method(:all) do
    returned_artworks = DB.exec('SELECT * FROM artworks;')
    artworks = []
    returned_artworks.each() do |artwork|
      name = artwork.fetch('name')
      museum_id = artwork.fetch('museum_id').to_i()
      artworks.push(Artwork.new({:name => name, :museum_id => museum_id}))
    end
    artworks
  end
end