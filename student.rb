require_relative 'person'

# This is student class, which represents student's information
class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hook
    '¯(ツ)/¯'
  end
end
