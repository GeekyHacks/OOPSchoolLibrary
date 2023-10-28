require './book'
require './rental'

describe Book do
  before(:each) do
    @book = Book.new('title', 'author')
    @rentals = []
  end

  describe '#new' do
    it 'returns a new book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#add_rental' do
    after(:each) do
      @rentals = [@rental]
    end

    it 'returns a new rental object' do
      person = double('Person', rentals: [])
      @rental = Rental.new('2020-10-10', @book, person)

      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'adds rental to person rentals list when add_rental method is called' do
      person = double('Person', rentals: [])
      @rental = Rental.new('2020-10-10', @book, person)

      expect(person.rentals).to include(@rental)
    end
  end
end
