class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Add the rental to the book's rentals and person's rentals
    book.rentals << self
    person.rentals << self
  end

  # Add a class-level array to store all rentals
  @all = []

  class << self
    attr_reader :all
  end
end
