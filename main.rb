require_relative 'app'
require_relative 'rental_manager'
require_relative 'people_loader'
require_relative 'books_loader'   
require_relative 'rentals_loader' 

class Main
  def initialize(app)
    @app = app
  end

  def run
    display_welcome_message

    loop do
      display_menu
      choice = gets.chomp.to_i

      case choice
      when 1..7
        execute_action(choice)
      when 8
        exit_app
        break
      else
        display_invalid_choice_message
      end
    end
  rescue StandardError => e
    display_error_message(e)
    run
  end

  private

  def display_welcome_message
    puts 'Welcome to my school library!'
  end

  def execute_action(choice)
    actions = [
      -> { @app.list_books }, -> { @app.list_people }, -> { @app.create_student },
      -> { @app.create_teacher }, -> { @app.create_book }, -> { @app.create_rental },
      -> { @app.list_rentals_for_person }
    ]
    actions[choice - 1].call
  end

  def save_data
    # Load existing data from JSON files
    existing_people = PeopleLoader.load || []
    existing_books = BooksLoader.load || []
    existing_rentals = RentalsLoader.load || []
  
    puts "Existing People: #{existing_people.inspect}"
    puts "Existing Books: #{existing_books.inspect}"
    puts "Existing Rentals: #{existing_rentals.inspect}"
  
    # Update the existing data with the current app data
    existing_people.replace(@app.people)
    existing_books.replace(@app.books)
    existing_rentals.replace(@app.rentals)
  
    # Write the updated data back to the JSON files
    File.write('people.json', existing_people.to_json)
    File.write('books.json', existing_books.to_json)
    File.write('rentals.json', existing_rentals.to_json)
  end
  

  

  def display_menu
    puts '-----------------------------------------------'
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a student'
    puts '4. Create a teacher'
    puts '5. Create a book'
    puts '6. Create a rental'
    puts '7. List rentals for a person'
    puts '8. Quit'
    print 'Enter your choice: '
  end

  def display_invalid_choice_message
    puts '************************************************************'
    puts 'Invalid choice. Please try again.'
    puts '************************************************************'
  end

  def exit_app
    begin
      save_data
      puts '************************************************************'
      puts 'Exiting the app. Goodbye!'
      puts '************************************************************'
    rescue StandardError => e
      puts '************************************************************'
      puts "An error occurred while saving data: #{e.message}"
      puts '************************************************************'
    end
  end

  def display_error_message(error)
    puts '************************************************************'
    puts "An error occurred: #{error.message}"
    puts '************************************************************'
  end
end

puts 'Welcome to my school library!'
main = Main.new(App.new)
main.run
