require_relative 'person'

# This is student class, which represents student's information
class Student < Person
  attr_reader :classroom

  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hook
    '¯(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
