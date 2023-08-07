require_relative '../teacher'

RSpec.describe Teacher do
  let(:specialization) { 'Math' }
  let(:teacher) { Teacher.new(1, 35, 'James Doe', 'Math') }
  describe '#initialize' do
    it 'creates a new teacher with valid attributes' do
      expect(teacher.id).to eq(1)
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('James Doe')
      expect(teacher.specialization).to eq('Math')
    end
  end
end
