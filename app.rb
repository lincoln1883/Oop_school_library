def menu
  loop do
    puts ' Welcome to School Library App! '.center(50, '#'), "\n"

    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a book'
    puts '4 - Create a person'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - exit'
    choice = gets.chomp

    break unless choice != '7'
  end
end

menu
