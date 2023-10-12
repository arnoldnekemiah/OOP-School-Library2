require 'json'

class BooksLoader
  def self.load
    if File.exist?('books.json')
      book_data = JSON.parse(File.read('books.json'))
      book_data.map { |data| Book.from_json(data) }
    else
      []
    end
  end

  def self.save(books)
    # Serialize the books to JSON using the to_json method
    File.write('books.json', books.map(&:to_json).to_json)
  end
end
