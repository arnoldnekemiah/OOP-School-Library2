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
require_relative 'people_loader'
require_relative 'books_loader'   
require_relative 'rentals_loader' 

class App
  attr_reader :people, :books, :rentals 
  def initialize
  @people = PeopleLoader.load || []
  @books = BooksLoader.load || []
  @rentals = RentalsLoader.load || []
    @book_loader = BooksLoader.new
    @rental_manager = RentalManager.new

    create_missing_data_files
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
    if student
      @people << student
      puts "Student #{student.name} created."
    else
      puts "Failed to create a student."
    end
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
    @rental_manager.create_rental(@people, @books, @rentals)
  end

  def list_rentals_for_person
    @rental_manager.list_rentals_for_person(@people)
  end

  def create_missing_data_files
    unless File.exist?('people.json')
      File.write('people.json', [].to_json)
    end
  
    unless File.exist?('books.json')
      File.write('books.json', [].to_json)
    end
  
    unless File.exist?('rentals.json')
      File.write('rentals.json', [].to_json)
    end
end
end