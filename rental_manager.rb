class RentalManager
  def initialize
    @rentals = []
  end

  def create_rental(people, books, _rentals)
    print 'Enter the ID of the person who is renting a book: '
    person_id = gets.chomp.to_i
    selected_person = people.find { |p| p.id == person_id }

    print 'Enter the ID of the book being rented: '
    book_id = gets.chomp.to_i
    selected_book = books.find { |b| b.id == book_id }

    print 'Enter the rental date (YYYY-MM-DD): '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, selected_book, selected_person)

    # Add the rental to the @rentals array
    @rentals << rental

    puts "Rental created for #{selected_person.name}: #{selected_book.title} on #{rental_date}."
  end

  def list_rentals_for_person(people)
    print 'Enter the ID of the person to list their rentals: '
    person_id = gets.chomp.to_i
    selected_person = people.find { |p| p.id == person_id }

    puts "Rentals for #{selected_person.name}:"
    rentals = @rentals.select { |r| r.person == selected_person }
    if rentals.empty?
      puts "No rentals found for #{selected_person.name}."
    else
      rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author}, rented on #{rental.date}"
      end
    end
  end
end
