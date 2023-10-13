require_relative 'spec_helper'

describe Rental do
  context 'When providing a book and a person' do
    book = Book.new('East of Eden', 'John Steinbeck')
    person = Person.new(id: nil, age: 40, name: 'mike', parent_permission: true)
    rental = Rental.new('18/12/2021', book, person)
    it 'should create a rental for person' do
      expect(person.rentals).to include(rental)
    end
    it 'should create a rental for book' do
      expect(book.rentals).to include(rental)
    end
  end
end
