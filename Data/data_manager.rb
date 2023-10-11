require 'json'

class ManageData
    attr_accessor :books, :person, :rentals

    def initialize
        @books = []
        @person = []
        @rentals = []
    end

    def load_data
        load_books
        load_person
        load_rentals
    end
    
    def save_data
        begin
            save_books
            puts "Book Saved."
        rescue StandardError => e
            puts "An error occured while saving data: #{e.message}"
        end
    end
    
    def save_books
        File.open('books.json', 'w') do |file|
            file.puts @books.map { |book|
             { 'title' => book.title,
             'author' => book.author }
            }.to_json
        end
    end

  private
def load_books
    return unless File.exist?('books.json')
    json_str = File.read('books.json')
    @books = JSON.parse(json_str).map do |book_data|
        Book.new(book_data['title'], book_data['author'])
    end
end    
end     