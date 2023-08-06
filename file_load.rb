require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'json'

def load_books
  stored_books = begin
    JSON.parse(File.read('books.json'))
  rescue StandardError
    []
  end
  books = []
  stored_books.map do |book_data|
    books << Book.new(book_data['title'], book_data['author'])
  end
  books
end

def load_person
  stored_people = begin
    JSON.parse(File.read('people.json'))
  rescue StandardError
    []
  end
  @people = stored_people.map do |person|
    if person.key?('classroom')
      Student.new(person['id'], person['age'], person['name'], person['classroom'], person['parent_permission'])
    elsif person.key?('specialization')
      Teacher.new(person['id'], person['age'], person['name'], person['specialization'])
    end
  end
end

def load_rentals
  stored_rentals = begin
    JSON.parse(File.read('rental.json'))
  rescue StandardError => e
    puts "Error reading 'rental.json': #{e.message}"
    []
  end
  @rentals = stored_rentals.map do |rental|
    date = rental['date']
    person_id = rental['person']['id']
    person = @people.find { |p| p.id == person_id }

    unless person
      person = Person.new(rental['person']['age'], rental['person']['name'])
      @people << person
    end

    book = Book.new(rental['book']['title'], rental['book']['author'])
    Rental.new(date, book, person)
  end
end
