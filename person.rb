require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = rand(1..1000)
    @age = age
    @name = name
    @rentals = []
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_a_book(date, person)
    Rental.new(date, self, person)
  end
end
