require_relative 'person'
require_relative 'classroom'
class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name, classroom, parent_permission)
    super(id, age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
