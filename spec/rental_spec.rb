require './rental'
require './book'
require './person'

describe Rental do
  let(:book) { Book.new('Book Title', 'Author') }
  let(:person) { Person.new(25, 'John Doe') }

  subject(:rental) { described_class.new('2023-10-26', book, person) }

  it { is_expected.to have_attributes(date: '2023-10-26', book: book, person: person) }

  it 'associates the rental with the book and person' do
    expect(book.rentals).to include(rental)
    expect(person.rentals).to include(rental)
  end
end
