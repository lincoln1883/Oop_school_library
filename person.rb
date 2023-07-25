require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', _parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?(parent_permission)
    @age >= 18 || parent_permission
  end

  def correct_name
    name
  end

  def rent_a_book(date, book)
    Rental.new(date, book, self)
  end
end
