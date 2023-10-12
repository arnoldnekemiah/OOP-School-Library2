require 'json'

class RentalsLoader
  def self.load
    if File.exist?('rentals.json')
      begin
        JSON.parse(File.read('rentals.json'))
      rescue JSON::ParserError
        puts 'Error parsing rentals.json. Using an empty array.'
        []
      end
    else
      []
    end
  end
end
