require_relative 'spec_helper'

describe Person do
  context 'When passing a name' do
    person = Person.new(id: nil, age: 25, name: 'somdotta', parent_permission: true)
    person_two = Person.new(id: nil, age: 12, name: 'orcun', parent_permission: false)

    it 'should validate the age of the person created' do
      expect(person.age).to eq 25
      expect(person_two.age).to eq 12
    end

    it 'should return true if he can use service' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return false if he cannot use service' do
      expect(person_two.can_use_services?).to eq false
    end

    it 'should add into rentals' do
      person.add_rentals(person)
      expect(person.rentals.length).to eq 1
    end
  end
end
