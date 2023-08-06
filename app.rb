require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'file_load'

class App
  def initialize
    @books = load_books
    @people = load_person
    @rentals = load_rentals
  end

  def list_all_books
    puts 'The list is empty, please create a book!' if @books.nil?
    @books.each { |ele| puts "Title: #{ele.title}, Author: #{ele.author}" }
  end

  def list_all_people
    puts 'The list is empty, please add a person!' if @people.nil?
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "Index: #{index}) ,Id: #{person.id}, Age: #{person.age}, Name: #{person.name},
         Classroom: #{person.classroom}"
      elsif person.instance_of?(Teacher)
        puts "Index: #{index}) ,Id: #{person.id}, Age: #{person.age}, Name: #{person.name},
         Specialization: #{person.specialization}"
      end
    end
    puts
  end

  def create_student
    puts 'Create a new student'
    print 'Please enter a age: '
    age = gets.chomp.to_i
    print 'Please enter a name: '
    name = gets.chomp.capitalize
    print 'Please enter a classroom: '
    classroom = gets.chomp.capitalize
    print 'Granted permission? [Y/N]: '
    permission_input = gets.chomp.downcase
    permission = permission_input == 'y'
    student = Student.new(id, age, name, classroom, permission)
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
    teacher = Teacher.new(id, age, name, specialization)
    @people << teacher
    puts 'Teacher successfully created!'
    puts
  end

  def create_a_person
    puts 'To create a Student press (1) to create a Teacher press (2) otherwise press (0)'
    choice = gets.chomp.to_i
    case choice
    when 1 then create_student
    when 2 then create_teacher
    when 0
      exit!
    else
      puts 'Invalid entry try again!'
      puts
    end
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
    puts " Please select a book by it's index: ".center(50, '-')
    @books.each_with_index { |book, index| puts "Index: #{index}) Title: #{book.title}, Author: #{book.author}" "\n" }
    print 'Index: '
    book_index = gets.chomp.to_i
    puts " You selected book index: #{book_index} ".center(50, '-')
    puts 'Please select a person by the index (not by ID): '.center(50, '-')
    @people.each_with_index do |person, index|
      puts "Index: #{index}) ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" "\n"
    end
    print 'Index: '
    person_index = gets.chomp.to_i
    puts "You selected person index: #{person_index}" "\n"
    date = Time.now
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts ' Successfully rented a book.'.center(50, '-')
    puts
  end

  def list_all_rentals
    puts ' Enter the person ID: '.center(50, '-')
    list_all_people
    print 'ID: '
    person_id = gets.chomp.to_i
    rentals_for_person = @rentals.select { |rental| rental.person.id == person_id }
    if rentals_for_person.empty?
      puts "No rentals found for the specified person ID. #{person_id}"
    else
      puts 'Rentals:'.center(50, '-')
      rentals_for_person.each do |rental|
        puts "Book: #{rental.book.title} by #{rental.book.author}, Rented date: #{rental.date}"
      end
    end
  end
end
