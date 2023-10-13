require_relative 'spec_helper'

describe Book do
  context 'It should create book and add rentals' do
    book = Book.new('East of Eden', 'John Steinbeck')
    it 'should create a new book' do
      expect(book.title).to eq 'East of Eden'
      expect(book.author).to eq 'John Steinbeck'
    end

    it 'should add a new rentals' do
      book.add_rental(book)
      expect(book.rentals.length).to eq 1
    end
  end
end
