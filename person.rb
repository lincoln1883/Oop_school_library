require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super()
    @id = id || generate_id
    @age = age
    @name = name
    @rentals = []
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1..100)
  end

  public

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_a_book(date, book)
    Rental.new(date, book, self)
  end
end
