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
    @books.each { |ele| puts "Title: #{ele.title} Author: #{ele.author}" }
  end

  def list_all_people
    puts 'The list is empty, please add a person!' if @people.empty?
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
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
      puts "Invalid entry try again!' \n"
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
    puts "Student successfully created!' \n"
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
    puts "Teacher successfully created!' \n"
  end

  def create_a_book
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    @books << book
    puts "Successfully created a book!' \n"
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
    print 'Date: '
    date = gets.chomp
    puts "You entered date: #{date}"
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts "Successfully rented a book.' \n"
  end

  def list_all_rentals
    puts 'ID of person: '
    gets.chomp.to_i
    puts 'Rentals: '
    @rentals.select do |rental|
      rental.person.id
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" "\n"
    end
  end

  def main_menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a book'
    puts '4 - Create a person'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - exit'
  end

  def user_choice(choice)
    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_book
    when 4
      create_a_person
    when 5
      create_a_rental
    when 6
      list_all_rentals
    else puts 'Exiting the program...'
         exit
    end
  end

  def menu
    puts ' Welcome to School Library App! '.center(50, '#'), "\n"
    loop do
      main_menu
      choice = gets.chomp.to_i
      user_choice(choice) || 7
    end
  end
end
