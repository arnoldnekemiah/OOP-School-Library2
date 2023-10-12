require 'json'

class BooksLoader
  def self.load
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'))
    else
      []
    end
  end
end
