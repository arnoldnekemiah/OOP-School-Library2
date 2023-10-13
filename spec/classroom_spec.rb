require './classroom'
require './student'

describe Classroom do
  context 'It should create a new class with label' do
    classroom_one = Classroom.new
    classroom_one.intitialize('Maths')
    student_one = Student.new(age: 10, classroom: nil, name: 'Damla', parent_permission: true)

    it 'should create new classroom with label' do
      expect(classroom_one.label).to eq 'Maths'
    end

    it 'should add new student' do
      puts student_one
      classroom_one.add_student(student_one)
      expect(student_one.classroom.label).to eq 'Maths'
    end
  end
end
