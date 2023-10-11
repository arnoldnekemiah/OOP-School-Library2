class RentalManager
  def initialize
    @rentals = []
  end

  lambda do |people|
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
