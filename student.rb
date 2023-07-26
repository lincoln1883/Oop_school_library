require_relative 'person'
class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, name, parent_permission)
    super(age, name)
    @id = id
    @classroom = []
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
