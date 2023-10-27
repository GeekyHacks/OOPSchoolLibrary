require './rental'

describe Rental do
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }

  subject(:rental) { described_class.new('2023-10-26', book, person) }

  it { is_expected.to have_attributes(date: '2023-10-26', book: book, person: person) }

  it 'associates the rental with the book and person' do
    expect(book.rentals).to be_empty
    expect(person.rentals).to be_empty

    rental

    expect(book.rentals).to contain_exactly(rental)
    expect(person.rentals).to contain_exactly(rental)
  end
end
