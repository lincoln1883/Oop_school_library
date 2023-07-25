require_relative 'person'
class Student < Person
  def initialize(age, name, classroom, parent_permission)
    super(age, name)
    @id = id
    @classroom = Classroom.new(classroom)
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
