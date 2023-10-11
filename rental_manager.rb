class RentalManager
  def initialize
    @rentals = []
  end

  def create_rental_wrapper(people, books, rentals)
    create_rental.call(people, books, rentals)
  end

  def list_rentals_for_person_wrapper(people)
    list_rentals_for_person.call(people)
  end
end
