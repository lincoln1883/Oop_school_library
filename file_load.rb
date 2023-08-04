require_relative 'book'
require 'json'

def load_books
  stored_books = begin
    JSON.parse(File.read('books.json'))
  rescue StandardError
    []
  end
  @books = stored_books.each do |book_data|
    Book.new(book_data['title'], book_data['author'])
  end
end
