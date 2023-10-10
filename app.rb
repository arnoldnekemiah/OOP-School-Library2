require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'person_factory'
require_relative 'book_loader'
require_relative 'rental_manager'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @person_factory = PersonFactory.new
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

  def create_person
    puts "Choose the type of person:\n1. Student\n2. Teacher"
    print 'Enter the type (1 or 2): '
    type = gets.chomp.to_i

    if type == 1
      student = @person_factory.create_student
      @people << student unless student.nil?
      puts "Student #{student.name} created."
    elsif type == 2
      teacher = @person_factory.create_teacher
      @people << teacher unless teacher.nil?
      puts "Teacher #{teacher.name} created."
    else
      puts 'Invalid choice,person not created.'
    end
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
end
