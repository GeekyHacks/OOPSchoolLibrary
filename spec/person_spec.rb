
require './person'

describe Person do
  before(:each) do
    @person = Person.new(23, 'name', parent_permission: true)
  end

  describe '#new' do
    it 'should return new instance of person object' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'should have a default name if name is not provided' do
      person = Person.new(23, nil, parent_permission: true)
      expect(person.name).to eql('name')
    end
  end

  describe '#id' do
    it 'should have a random id within the range of 1 to 1000' do
      expect(@person.id).to be >= 1
      expect(@person.id).to be <= 1000
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

  describe '#correct_name' do
    it 'should return the correct name when correct_name method is called' do
      expect(@person.correct_name).to eql('name')
    end
  end

  describe '#add_rental' do
    it 'returns a new rental object' do
      book = double('Book', rentals: [])
      rental = @person.add_rental('2020-10-10', book)

      expect(rental).to be_an_instance_of(Rental)
    end

    it 'adds rental to person rentals list when add_rental method is called' do
      book = double('Book', rentals: [])
      rental = @person.add_rental('2020-10-10', book)

      expect(book.rentals).to include(rental)
    end
  end
end