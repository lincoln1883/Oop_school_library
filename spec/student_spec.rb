require_relative '../student'

RSpec.describe Student do
  let(:classroom) { Classroom.new(label: 'Science') }

  describe '#initialize' do
    it 'creates a new student with valid attributes' do
      student = Student.new(1, 18, 'John Doe', classroom, parent_permission: true)
      expect(student.id).to eq(1)
      expect(student.age).to eq(18)
      expect(student.name).to eq('John Doe')
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky emoji' do
      student = Student.new(1, 18, 'John Doe', classroom, true)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#add_to_classroom' do
    it 'adds the student to the classroom' do
      student = Student.new(1, 18, 'John Doe', classroom, true)
      student.add_to_classroom(classroom)

      expect(classroom.students).to include(student)
    end

    it 'does not duplicate the student in the classroom' do
      student = Student.new(1, 18, 'John Doe', classroom, true)
      2.times { student.add_to_classroom(classroom) }

      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
