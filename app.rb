require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @people = []
  end

  def list_all_books
    puts 'list all books'
  end

  def list_all_people
    puts 'There is no one on record, please add a person!' if @people.empty?
    @people.each do |person|
      puts "Name: #{person.name}, Age: #{person.age} "
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
      puts 'Invalid entry try again!'
    end
  end

  def create_student
    puts 'Create a new student'
    print 'Please enter a age: '
    age = gets.chomp.to_i
    print 'Please enter a name: '
    name = gets.chomp
    print 'Granted permission? [Y/N]: '
    permission = gets.chomp.downcase
    permission.include?('y')
    student = Student.new(age, name, classroom: @classroom, parents_permission: permission)
    puts 'Student successfully created!'
    @people << student
  end

  def create_teacher
    puts 'teacher'
  end

  def create_a_book
    puts 'create a book'
  end

  def create_a_rental
    puts 'rent a book'
  end

  def list_all_rentals
    puts 'list all books you have in rental'
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
