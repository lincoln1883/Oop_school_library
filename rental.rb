class Rental
  attr_accessor :book, :person, :date

  def initialize(date, book, person)
    @date = date || Time.now
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
