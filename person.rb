require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # has-many relationship with Rental
  def rentals
    Rental.all.select { |rental| rental.person == self }
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end
