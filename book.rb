require_relative 'rental'
class Book
  attr_accessor :author, :title, :rental

  def initialize(title, author, rental)
    @title = title
    @author = author
    @rental = rental
  end
end
