require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'The list is empty, please create a book!' if @books.empty?
    @books.each { |ele| puts "Title: #{ele.title}, Author: #{ele.author}" }
    puts
  end

  def list_all_people
    puts 'The list is empty, please add a person!' if @people.empty?
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    puts
  end

  def create_a_person
    puts 'To create a Student press (1) to create a Teacher press (2) otherwise press (0)'
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    when 0
      exit!
    else
      puts 'Invalid entry try again!'
      puts
    end
  end

  def create_student
    puts 'Create a new student'
    print 'Please enter a age: '
    age = gets.chomp.to_i
    print 'Please enter a name: '
    name = gets.chomp.capitalize
    print 'Granted permission? [Y/N]: '
    permission_input = gets.chomp.downcase
    permission = permission_input == 'y'
    student = Student.new(age, name, permission)
    @people << student
    puts 'Student successfully created!'
    puts
  end

  def create_teacher
    puts 'Create a teacher'
    print 'Please enter a age: '
    age = gets.chomp.to_i
    print 'Please enter a name: '
    name = gets.chomp.capitalize
    print 'Please enter a specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Teacher successfully created!'
    puts
  end

  def create_a_book
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    @books << book
    puts 'Successfully created a book!'
    puts
  end

  def create_a_rental
    puts "Please select a book by it's index: "
    @books.each_with_index { |book, index| puts "Index: #{index}) Title: #{book.title}, Author: #{book.author}" "\n" }
    book_index = gets.chomp.to_i
    puts "You selected book index: #{book_index}"
    puts 'Please select a person by the index (not by ID): '
    @people.each_with_index do |person, index|
      puts "Index: #{index}) ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" "\n"
    end
    person_index = gets.chomp.to_i
    puts "You selected person index: #{person_index}"
    puts 'Please enter a date: '
    print 'Date: '
    date = gets.chomp
    puts "You entered date: #{date}"
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Successfully rented a book.'
    puts
  end

  def list_all_rentals
    puts 'Enter the person ID: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id.equal?(person_id)
        puts "Person with id: #{person_id} has the following: "
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" "\n"
      else
        puts 'You currently have no rented books!'
      end
      puts
    end
  end
end
