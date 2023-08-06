require_relative 'app'
require_relative 'file_save'

def main
  app = App.new
  app.send(:menu)
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
    print 'Choice: '
    choice = gets.chomp.to_i
    user_choice(choice) || 7
    save_book
    save_person
    save_rental
  end
end
main
