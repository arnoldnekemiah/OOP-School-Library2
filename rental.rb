class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Add the rental to the book's rentals and person's rentals
    book.add_rentals << self
    person.add_rentals << self
  end

  # Add a class-level array to store all rentals
  @all = []

  class << self
    attr_reader :all
  end
end
