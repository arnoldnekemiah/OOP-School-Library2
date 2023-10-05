require_relative 'app'

class Main
  def initialize(app)
    @app = app
  end

  def run
    actions = [
      -> { @app.list_books }, -> { @app.list_people }, -> { @app.create_person }, -> { @app.create_book },
      -> { @app.create_rental }, -> { @app.list_rentals_for_person }
    ]
    loop do
      display_menu
      choice = gets.chomp.to_i
      case choice
      when 1..6
        actions[choice - 1].call
      when 7
        puts 'Exiting the app. Goodbye!'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
    run
  end

  def display_menu
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
    print 'Enter your choice: '
  end
end

puts 'Welcome to the Library Management System!'
main = Main.new(App.new)
main.run
