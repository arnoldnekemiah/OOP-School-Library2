require './person'
attr_reader :classroom

# This is student class, which represents student's information
class Student < Person
  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hook
    '¯(ツ)/¯'
  end
end
