require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts '************************************************************'
    puts "List of Books (#{@books.length}):"
    @books.each do |book|
      puts "#{book.id} - #{book.title} by #{book.author}"
    end
    puts '************************************************************'
  end

  def list_people
    puts '************************************************************'
    puts "List of People (#{@people.length}):"
    @people.each do |person|
      puts "#{person.id} - #{person.name} (#{person.is_a?(Student) ? 'Student' : 'Teacher'})"
    end
    puts '************************************************************'
  end

  def create_person
    puts "Choose the type of person:\n1. Student\n2. Teacher"
    print 'Enter the type (1 or 2): '
    type = gets.chomp.to_i

    if type == 1
      student = create_student
      @people << student unless student.nil?
      puts "Student #{student.name} created."
    elsif type == 2
      teacher = create_teacher
      @people << teacher unless teacher.nil?
      puts "Teacher #{teacher.name} created."
    else
      puts 'Invalid choice,person not created.'
    end
  end

  def create_rental
    list_people
    print 'Enter the ID of the person who is renting a book: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    list_books
    print 'Enter the ID of the book being rented: '
    book_id = gets.chomp.to_i
    book = @books.find { |b| b.id == book_id }

    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created for #{person.name}: #{book.title} on #{date}."
  end

  def list_rentals_for_person
    list_people
    print 'Enter the ID of the person to list their rentals: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    puts "Rentals for #{person.name}:"
    rentals = @rentals.select { |r| r.person == person }
    if rentals.empty?
      puts "No rentals found for #{person.name}."
    else
      rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author}, rented on #{rental.date}"
      end
    end
  end
end
