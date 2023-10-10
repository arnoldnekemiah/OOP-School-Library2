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

  def self.create_student
    print 'Name: '
    name = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp.to_str
    return nil unless classroom.length >= 1

    print 'Age (numeric): '
    age = gets.chomp.to_i
    return nil unless age.positive?

    print 'Parent permission (y for true or n for false): '
    parent_permission = gets.chomp

    Student.new(classroom: classroom, age: age, name: name, parent_permission: parent_permission.downcase == 'y')
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
