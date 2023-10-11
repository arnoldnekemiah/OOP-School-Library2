require 'json'

class ManageData
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def save_data
    save_books
    save_people
    save_rentals
    puts 'Data Saved.'
  rescue StandardError => e
    puts "An error occured while saving data: #{e.message}"
  end

  def save_books
    File.open('books.json', 'w') do |file|
      file.puts @books.map { |book|
        { 'title' => book.title,
          'author' => book.author }
      }.to_json
    end
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.puts @people.map { |person|
        {
           id: person.id,
          name: person.name
          age: person.age
          type: person.class
          rentals: person.rentals
          parent_permission: person.parent_permission
          specialization: specialization_check(person)}
      }.to_json
    end

    def specialization_check(person)
      if person.instance_of? (Teacher)
        person.specialization 
      else
        'No specialization'
      end
    end
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.puts @rentals.map { |rental|
        { 'date' => rental.date,
          'book' => rental.book,
          'person' => rental.person }
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

  def load_people(data)
    data.each do |person_data|
      if person_data['type'] == 'Student'
        student = Student.new(person_data['age'], person_data['name'], parent_permission: person_data['parent_permission'])
        student.instance_variable_set(:@id, person_data['id'])
        @people << student
      else
        teacher =Teacher.new(person_data['specialization'], person_data['age'], person_data['name'])
        teacher.instance_variable_set(:@id, person_data['id'])
        @people << teacher
      end
  end
  @people
  end

  def load_rentals
end
