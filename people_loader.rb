require 'json'

class PeopleLoader
  def self.save(people)
    json_data = people.map do |person|
      if person.is_a?(Student)
        {
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
          classroom: person.classroom
        }
      elsif person.is_a?(Teacher)
        {
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
      end
    end

    File.write('people.json', json_data.to_json)
  end

  def self.load
    load_from_file('people.json')
  end

  def self.load_from_file(filename)
    if File.exist?(filename)
      json_data = JSON.parse(File.read(filename))
      deserialize_people(json_data)
    else
      []
    end
  rescue JSON::ParserError
    puts "Error parsing #{filename}. Using an empty array."
    []
  end

  def self.deserialize_people(data)
    data.map do |person_data|
      if person_data['classroom']
        Student.new(
          name: person_data['name'],
          age: person_data['age'],
          parent_permission: person_data['parent_permission'],
          classroom: person_data['classroom']
        )
      else
        Teacher.new(
          name: person_data['name'],
          age: person_data['age'],
          specialization: person_data['specialization']
        )
      end
    end
  end
end
