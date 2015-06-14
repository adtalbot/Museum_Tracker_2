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
  
  describe('#save') do
    it('adds artwork to the database') do
      test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
      test_artwork.save()
      expect(Artwork.all()).to(eq([test_artwork]))
    end
  end
  
  describe('#==') do
    it('recognizes that two instance of artwork with the same name and museum_id are equal') do
      test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
      test_artwork2 = Artwork.new({:name => 'Painting', :museum_id => 1})
      expect(test_artwork).to(eq(test_artwork2))
    end
  end
    
#   describe('.find') do
#     it('returns artwork by its museum id') do
#       test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
#       test_artwork.save()
#       test_artwork2 = Artwork.new({:name => 'Sculpture', :museum_id => 2})
#       test_artwork2.save()
#       expect(Artwork.find(test_artwork.museum_id()).to(eq(test_artwork)))
#     end
#   end
  
  describe('#update') do 
    it('updates artwork in the database') do
      test_artwork = Artwork.new({:name => 'Painting', :museum_id => 1})
      test_artwork.save()
      test_artwork.update({:name => 'Sculpture'})
      expect(test_artwork.name()).to(eq('Sculpture'))
    end
  end                                                                                                                                    
end
