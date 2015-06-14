class Artwork
  attr_reader(:name, :museum_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @museum_id = attributes.fetch(:museum_id).to_i()
  end
end