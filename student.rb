require_relative 'person'
class Student < Person
  def initialize(age, name, classroom, parent_permission)
    super(age, name, _parent_permission: parent_permission)
    @id = id
    @name = name
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new(12, 'ben', 'bio', true)
p student
