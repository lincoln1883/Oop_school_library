require_relative 'person'
require_relative 'classroom'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, parent_permission)
    super(age, name, parent_permission)
    @id = id
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def parent_permission
    can_use_services?
  end
end
