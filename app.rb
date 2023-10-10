require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'book_loader'
require_relative 'rental_manager'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @book_loader = BooksLoader.new
    @rental_manager = RentalManager.new
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

  def create_student
    student = Student.create_student
    @people << student unless student.nil?
    puts "Student #{student.name} created."
  end

  def create_teacher
    teacher = Teacher.create_teacher
    @people << teacher unless teacher.nil?
    puts "Teacher #{teacher.name} created."
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "Book '#{book.title}' by #{book.author} created."
  end

  def create_rental
    def initialize(people, books, rentals, date)
      @people = people
      @books =books
      @rentals = rentals
      @date = date
    end

    def create_rental(people, books, rentals)
      print 'Enter the ID of the person who is renting a book: '
      person_id = gets.chomp.to_i
      selected_person = people.find { |p| p.id == person_id }
  
      print 'Enter the ID of the book being rented: '
      book_id = gets.chomp.to_i
      selected_book = books.find { |b| b.id == book_id }
  
      print 'Enter the rental date (YYYY-MM-DD): '
      rental_date = gets.chomp
  
      rental = Rental.new(rental_date, selected_book, selected_person)
      rentals << rental
      puts "Rental created for #{selected_person.name}: #{selected_book.title} on #{rental_date}."
    end

    def list_rentals_for_person(_person)
      list_people
      print 'Enter the ID of the person to list their rentals: '
      person_id = gets.chomp.to_i
      selected_person = @people.find { |p| p.id == person_id }
  
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
end
