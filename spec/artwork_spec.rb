require('spec_helper')

describe(Artwork) do
  describe('#initialize') do
    it('initializes a new instance of artwork with a name') do
      test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
      expect(test_artwork).to(be_an_instance_of(Artwork))
    end
    it('initializes a new instance of artwork with a museum id') do
      test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
      expect(test_artwork.museum_id()).to(be_an_instance_of(Fixnum))
    end
  end
  
  describe('.all') do
    it('is empty at first') do
      expect(Artwork.all()).to(eq([]))
    end
  end
end