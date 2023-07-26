require_relative 'rental'
class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
