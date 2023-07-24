require_relative 'person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @id = id
    @age = age
    @name = name
    @specialization = specialization
  end

  def can_use_services?
    super parent_permission: true
  end
end
