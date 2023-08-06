require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new(1, 12, name: 'bill', parent_permission: true) }
  context '#new person' do
    let(:person) { Person.new(1, 12, name: 'bill', parent_permission: true) }
    it 'creates a person' do
      expect(person.id).to eq(1)
      expect(person.age).to eq(12)
      expect(person.name).to eq('bill')
    end
  end
  describe '#correct name' do
    it 'should  return correct name' do
      expect(person.correct_name).to eq('bill')
    end
  end
  describe '#can use services' do
    it 'should return true if age is greater than 18' do
      expect(person.can_use_services?).to be(true)
    end
  end
end
