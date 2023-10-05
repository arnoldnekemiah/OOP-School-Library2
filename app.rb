require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

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
    puts "Enter person's name:"
    name = gets.chomp
    puts "Enter person's age:"
    age = gets.to_i

    puts "Is this person a teacher or a student? (t/s)"
    role = gets.chomp.downcase

    if role == 't'
      puts "Enter teacher's specialization:"
      specialization = gets.chomp
      person = Teacher.new(name: name, age: age, specialization: specialization)
    elsif role == 's'
      puts "Does this student have parent permission? (yes/no)"
      parent_permission = gets.chomp.downcase == 'yes'
      puts "Enter classroom label:"
      classroom_label = gets.chomp
      classroom = @people.find { |p| p.is_a?(Classroom) && p.label == classroom_label }
      if classroom.nil?
        classroom = Classroom.new(classroom_label)
        @people << classroom
      end
      person = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    else
      puts "Invalid role. Please enter 't' for teacher or 's' for student."
      return
    end

    @people << person
    puts "Person created successfully!"
  end

  def create_book
    puts "Enter book title:"
    title = gets.chomp
    puts "Enter author's name:"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully!"
  end

  def create_rental
    puts "Enter rental date (YYYY-MM-DD):"
    date = gets.chomp
    puts "Enter person's ID:"
    person_id = gets.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID #{person_id}."
      return
    end
    puts "Enter book title:"
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts "Book not found with title '#{book_title}'."
      return
    end
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created successfully!"
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
      puts "\nOptions:"
      puts "1. List all books"
      puts "2. List all people"
      puts "3. Create a person"
      puts "4. Create a book"
      puts "5. Create a rental"
      puts "6. List all rentals for a person"
      puts "7. Quit"
      print "Enter your choice: "
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
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please choose a valid option."
      end
    end
  end
end
