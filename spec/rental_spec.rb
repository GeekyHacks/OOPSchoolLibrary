require './rental'

describe Rental do
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }

  subject(:rental) { described_class.new('2023-10-26', book, person) }

  it { is_expected.to have_attributes(date: '2023-10-26', book: book, person: person) }

  it 'associates the rental with the book and person' do
    expect(book).to receive(:rentals=).with([rental])
    expect(person).to receive(:rentals=).with([rental])
    rental
  end
end
