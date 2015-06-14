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
end