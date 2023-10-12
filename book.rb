class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = rand(1..200)
    @title = title
    @author = author
    @rentals = []
  end

  # has-many relationship with Rental
  def add_rental(rental)
    existing_rental = @rentals.find { |r| r.date == rental.date }
    @rentals << rental unless existing_rental
  end
end
