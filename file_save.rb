require 'json'
require_relative 'book'

def save_book
  books_arr = []
  @books.each { |book| books_arr.push({ title: book['title'], author: book['author'] }) }
  File.write('books.json', books_arr.to_json) if @books.any?
end
