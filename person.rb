require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :rentals
  attr_reader :name, :age

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # has-many relationship with Rental
  def add_rental(rental)
    existing_rental = @rentals.find { |r| r.date == rental.date }
    @rentals << rental unless existing_rental
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1..200)
  end
end
