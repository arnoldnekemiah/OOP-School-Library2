class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # method to add a student to the classroom
  def add_student(student)
    @students << student
    student.add_to_classroom = self
  end
end
