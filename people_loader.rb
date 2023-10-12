class PeopleLoader
  def self.load
    if File.exist?('people.json')
      begin
        json_data = load_json_data('people.json')
        parse_people_data(json_data)
      rescue JSON::ParserError
        puts 'Error parsing people.json. Using an empty array.'
        []
      end
    else
      []
    end
  end

  def self.load_json_data(filename)
    JSON.parse(File.read(filename))
  rescue JSON::ParserError
    puts "Error parsing #{filename}. Using an empty array."
    []
  end

  def self.parse_people_data(data)
    data.map do |person_data|
      if person_data['classroom']
        create_student(person_data)
      else
        create_teacher(person_data)
      end
    end
  end

  def self.create_student(data)
    Student.new(
      name: data['name'],
      age: data['age'],
      parent_permission: data['parent_permission'] == true,
      classroom: data['classroom']
    )
  end

  def self.create_teacher(data)
    Teacher.new(
      name: data['name'],
      age: data['age']
    )
  end
end
