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
  
  define_method(:save) do
    DB.exec("INSERT INTO artworks (name, museum_id) VALUES ('#{@name}', #{@museum_id});")
  end
  
  define_method(:==) do |another_artwork|
    self.name().==(another_artwork.name()).&(self.museum_id().==(another_artwork.museum_id()))
  end
  
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @museum_id = self.museum_id()
    DB.exec("UPDATE artworks SET name = '#{@name}' WHERE museum_id = #{@museum_id};")
  end
end