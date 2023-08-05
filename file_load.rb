require_relative 'book'
require_relative 'person'
require 'json'

def load_books
  stored_books = begin
    JSON.parse(File.read('books.json'))
  rescue StandardError
    []
  end
  stored_books.map do |book_data|
    Book.new(book_data['title'], book_data['author'])
  end
end

def load_person
  stored_people = begin
    JSON.parse(File.read('people.json'))
  rescue StandardError
    []
  end

  @people = stored_people.map do |person|
    if person.key?('classroom')
      Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
    elsif person.key?('specialization')
      Teacher.new(person['age'], person['name'], person['specialization'])
    end
  end
end
