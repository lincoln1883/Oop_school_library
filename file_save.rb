require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def save_book
  books_arr = []
  @books.each { |book| books_arr.push({ title: book.title, author: book.author }) }
  File.write('books.json', books_arr.to_json) if @books.any?
end

def save_person
  valid_people = @people.compact
  person_arr = valid_people.map do |person|
    person_data = {
      id: person.id,
      age: person.age,
      name: person.name
    }

    if person.is_a?(Teacher)
      person_data[:specialization] = person.specialization
    elsif person.is_a?(Student)
      person_data[:parent_permission] = person.parent_permission
      person_data[:classroom] = person.classroom
    end

    person_data
  end

  File.write('people.json', person_arr.to_json) if @people.any?
end

def save_rental
  rental_data = @rentals.map do |rent|
    {
      date: rent.date,
      person: {
        id: rent.person.id,
        age: rent.person.age,
        name: rent.person.name,
        parent_permission: rent.person.can_use_services?
      },
      book: {
        title: rent.book.title,
        author: rent.book.author
      }
    }
  end
  File.write('rental.json', rental_data.to_json)
end
