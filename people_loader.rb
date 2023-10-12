class PeopleLoader
    def self.load
      if File.exist?('people.json')
        begin
          json_data = JSON.parse(File.read('people.json'))
          json_data.map do |person_data|
            if person_data['classroom']
              Student.new(
                name: person_data['name'],
                age: person_data['age'],
                parent_permission: person_data['parent_permission'] == true,
                classroom: person_data['classroom']
              )
            else
              Teacher.new(
                name: person_data['name'],
                age: person_data['age']
              )
            end
          end
        rescue JSON::ParserError
          puts 'Error parsing people.json. Using an empty array.'
          []
        end
      else
        []
      end
    end
  end
  