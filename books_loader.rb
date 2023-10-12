require 'json'

class BooksLoader
  def self.load
    if File.exist?('books.json')
      begin
        JSON.parse(File.read('books.json')).map do |book_data|
          create_book(book_data)
        end
      rescue JSON::ParserError => e
        puts "Error parsing books.json: #{e.message}. Using an empty array."
        []
      end
    else
      []
    end
  end

  def self.create_book(data)
    title = data['title']
    author = data['author']
    Book.new(title, author)
  end
end
