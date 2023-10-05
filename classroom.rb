class Classroom
  attr_reader :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # method to add a student to the classroom
  def add_student(student)
    @students << student
    student.classroom = self
  end
end
