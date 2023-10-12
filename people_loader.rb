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
          age: person.age
        }
      end
    end

    File.write('people.json', json_data.to_json)
  end

  def self.load
    if File.exist?('people.json')
      begin
        json_data = JSON.parse(File.read('people.json'))
        people = json_data.map do |person_data|
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
              age: person_data['age']
            )
          end
        end
        people
      rescue JSON::ParserError
        puts 'Error parsing people.json. Using an empty array.'
        []
      end
    else
      []
    end
  end
end
