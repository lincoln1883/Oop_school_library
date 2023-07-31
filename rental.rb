class Rental
  attr_accessor :book, :person
  attr_reader :date

  def initialize(book, person)
    @date = Time.now
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
