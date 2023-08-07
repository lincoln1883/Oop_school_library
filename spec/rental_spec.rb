# rental_spec.rb
require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new('John Doe', 25) }
  let(:date) { Time.new(2023, 8, 3) }

  describe '#initialize' do
    it 'creates a new rental with valid attributes' do
      date = Time.new(2023, 8, 3)
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'sets the current date if no date is provided' do
      rental = Rental.new(nil, book, person)
      expect(rental.date).to be_within(1).of(Time.now)
    end

    it 'adds the rental to the book and person rentals list' do
      rental = Rental.new(Time.new(2023, 8, 3), book, person)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
