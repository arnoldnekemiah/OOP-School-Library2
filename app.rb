# app.rb
require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom' 

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}. Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person
    name, age, role = get_person_info
    if role == 't'
      create_teacher(name, age)
    elsif role == 's'
      create_student(name, age)
    else
      puts "Invalid role. Please enter 't' for teacher or 's' for student."
    end
  end

  def get_person_info
    puts "Enter person's name:"
    name = gets.chomp
    puts "Enter person's age:"
    age = gets.to_i
    puts 'Is this person a teacher or a student? (t/s)'
    role = gets.chomp.downcase
    [name, age, role]
  end

  def create_teacher(name, age)
    puts "Enter teacher's specialization:"
    specialization = gets.chomp
    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    @people << teacher
    puts 'Teacher created successfully!'
  end

  def create_student(name, age)
    puts 'Does this student have parent permission? (yes/no)'
    parent_permission = gets.chomp.downcase == 'yes'
    puts 'Enter classroom label:'
    classroom_label = gets.chomp
    classroom = find_or_create_classroom(classroom_label)
    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    @people << student
    puts 'Student created successfully!'
  end

  def find_or_create_classroom(label)
    classroom = @people.find { |p| p.is_a?(Classroom) && p.label == label }
    if classroom.nil?
      classroom = Classroom.new(label)
      @people << classroom
    end
    classroom
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts "Enter author's name:"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Enter rental date (YYYY-MM-DD):'
    date = gets.chomp
    puts "Enter person's ID:"
    person_id = gets.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID #{person_id}."
      return
    end
    puts 'Enter book title:'
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts "Book not found with title '#{book_title}'."
      return
    end
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    puts "Enter person's ID:"
    person_id = gets.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID #{person_id}."
      return
    end
    rentals = person.rentals
    puts "Rentals for #{person.name}:"
    rentals.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end

  def run
    loop do
      display_menu
      choice = gets.to_i
      case choice
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
      when 7
        exit_program
      else
        puts 'Invalid choice. Please choose a valid option.'
      end
    end
  end

  def display_menu
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'
    print 'Enter your choice: '
  end

  def exit_program
    puts "Goodbye!"
    exit(0)
  end
  
end
