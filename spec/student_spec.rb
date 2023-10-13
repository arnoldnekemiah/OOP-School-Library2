require_relative '../student'
require_relative '../classroom'
require_relative '../person'
describe Student do
  context 'When providing student information' do
    classroom = Classroom.new
    person = Student.new(id: nil, classroom: classroom, age: 22, name: 'lisa', parent_permission: true)
    person_two = Student.new(id: nil, classroom: classroom, age: 16, name: 'john', parent_permission: false)
    it 'creates a student person' do
      expect(person.name).to eq 'lisa'
    end
    it 'creates a student without permission' do
      expect(person_two.can_use_services?).to eq false
    end
    it 'adds student to classroom' do
      expect(person.classroom).to eq classroom
    end
    it 'should print custom message' do
      expect(person.play_soccer).to eq "¯\(ツ)/¯"
    end
  end
end