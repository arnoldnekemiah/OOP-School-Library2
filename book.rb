class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = rand(1..200)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json
    {
      id: @id,
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_json)
    }
  end

  def self.from_json(json_str)
    data = JSON.parse(json_str)
    book = new(data['title'], data['author'])
    book.instance_variable_set('@id', data['id'])
    book.instance_variable_set('@rentals', data['rentals'].map { |r| Rental.from_json(r.to_json) })
    book
  end

  # has-many relationship with Rental
  def add_rental(rental)
    existing_rental = @rentals.find { |r| r.date == rental.date }
    @rentals << rental unless existing_rental
  end
end
