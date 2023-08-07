require_relative '../classroom'

RSpec.describe Classroom do
	describe '#initialize' do
		it 'creates a new classroom with valid attributes' do
			classroom = Classroom.new(label: 'Science')
			expect(classroom.label).to eq('Science')
			expect(classroom.students).to eq([])
		end
	end
end