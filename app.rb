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
require_relative 'data_manager'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @book_loader = BooksLoader.new
    @rental_manager = RentalManager.new
    @data_manager = ManageData.new
  end

  def load_data
    @data_manager.load_data
    @books = @data_manager.books
    @people = @data_manager.people
    @rentals = @data_manager.rentals
  end

  def save_data
    @data_manager.save_books
    puts 'Book saved successfully.'
    @data_manager.save_people
    puts 'Person saved successfully.'
    @data_manager.save_rentals
    puts 'Rental saved successfully.'

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

    def create_book_wrapper
      create_book.call
    end

    def create_rental_wrapper(people, books, _rentals)
      create_rental.call(people, books, _rentals)
    end

    def list_rentals_for_person_wrapper(people)
      list_rentals_for_person.call(people)
    end
  end
end
