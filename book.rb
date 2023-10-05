class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
  end

  # has-many relationship with Rental
  def rentals
    Rental.all.select { |rental| rental.book == self }
  end
end
