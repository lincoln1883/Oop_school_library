require_relative 'person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, parent_permission)
    super(age, name)
    @id = id
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
