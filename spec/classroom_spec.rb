require_relative 'spec_helper'

describe Classroom do
  let(:classroom) { Classroom.new('Maths') }

  context 'when creating a new classroom' do
    it 'should have a label' do
      expect(classroom.label).to eq('Maths')
    end

    it 'should have an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end

  context 'when adding students to the classroom' do
    let(:student1) { Student.new(age: 12, classroom: nil, name: 'Alice', parent_permission: true) }
    let(:student2) { Student.new(age: 13, classroom: nil, name: 'Bob', parent_permission: true) }

    it 'should add a student to the classroom' do
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it 'should not add the same student twice' do
      classroom.add_student(student2)
      classroom.add_student(student2)
      expect(classroom.students.count).to eq(1)
    end

    it 'should set the classroom for the student' do
      classroom.add_student(student1)
      expect(student1.classroom).to eq(classroom)
    end
  end
end
