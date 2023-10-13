require_relative 'spec_helper'

describe Student do
  let(:classroom) { Classroom.new('Maths') }
  let(:student) { Student.new(age: 16, classroom: classroom, name: 'Alice', parent_permission: true) }

  context 'when creating a new student' do
    it 'should have a name' do
      expect(student.name).to eq('Alice')
    end

    it 'should have an age' do
      expect(student.age).to eq(16)
    end

    it 'should have parent permission' do
      expect(student.parent_permission).to be(true)
    end

    it 'should belong to a classroom' do
      expect(student.classroom).to eq(classroom)
    end
  end

  context 'when changing the classroom of a student' do
    let(:new_classroom) { Classroom.new('Science') }

    it 'should set the new classroom for the student' do
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
    end

    it 'should add the student to the new classroom' do
      student.classroom = new_classroom
      expect(new_classroom.students).to include(student)
    end

    it 'should remove the student from the old classroom' do
      old_classroom = student.classroom
      student.classroom = new_classroom
      expect(old_classroom.students).not_to include(student)
    end
  end

  context 'when a student plays hooky' do
    it 'should return a message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
