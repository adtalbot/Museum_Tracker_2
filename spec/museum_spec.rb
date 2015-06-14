require('spec_helper')

describe(Museum) do
  describe('#initialize') do
    it('initializes each instance of museum with a name') do
      test_museum = Museum.new({:name => 'Portland Museum', :id => nil})
      expect(test_museum).to(be_an_instance_of(Museum))
    end
    it('initializes each instance of museum with a database id') do
      test_museum = Museum.new({:name => 'Portland Museum', :id => nil})
    end
  end
  
  describe('.all') do
    it('is empty at first') do
      expect(Museum.all()).to(eq([]))
    end
  end
  
  describe('#save') do
    it('adds a museum to the database') do
      test_museum = Museum.new({:name => 'Portland Museum', :id => nil})
      test_museum.save()
      expect(Museum.all()).to(eq([test_museum]))
    end
  end
  
  describe('#==') do
    it('recognizes that two museums that have the same name and ID are equal') do
      test_museum = Museum.new({:name => 'Portland Museum', :id => nil})
      test_museum2 = Museum.new({:name => 'Portland Museum', :id => nil})
      expect(test_museum).to(eq(test_museum2))
    end
  end
end