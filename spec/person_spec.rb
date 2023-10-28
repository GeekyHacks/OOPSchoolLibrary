require './person'

describe Person do
  before(:each) do
    @person = Person.new(23, 'name', parent_permission: true)
    @rentals = []
  end

  describe '#new' do
    it 'should return new instance of person object' do
      expect(@person).to be_an_instance_of(Person)
    end
  end
  describe '#@id' do
    it 'should return a random id for the person object' do
      @id = Random.rand(1..1000)
      expect(@person.instance_variable_get(:@id)).not_to be_nil
    end
  end

  describe '#of_age?' do
    it 'should return true if age is greater or equal to 18' do
      expect(@person.age).to be >= 18
    end
  end
  describe '#can_use_services?' do
    it 'should return true if parent_permission or of_age? is true' do
      expect(@person.can_use_services?).to be true
    end

    it 'should return false if parent_permission and of_age? are false' do
      @person = Person.new(16, 'name', parent_permission: false)
      expect(@person.can_use_services?).to be false
    end
  end
  describe '#add_rental' do
    after(:each) do
      @rentals = [@rental]
    end

    it 'returns a new rental object' do
      book = double('Book', rentals: [])
      @rental = Rental.new('2020-10-10', book, @person)

      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'adds rental to person rentals list when add_rental method is called' do
      book = double('Book', rentals: [])
      @rental = Rental.new('2020-10-10', book, @person)

      expect(book.rentals).to include(@rental)
    end
  end
end
