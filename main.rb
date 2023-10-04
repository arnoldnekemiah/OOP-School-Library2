# main.rb

# Require the decorator classes
require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Require other classes
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create instances of Person, Student, and Teacher
person = Person.new(name: 'John', age: 25, parent_permission: false)
student = Student.new(classroom: 'Math', name: 'Alice', age: 17, parent_permission: true)
student_b = Student.new(classroom: 'Math', name: 'Erick', age: 17, parent_permission: false)
student_b.name = 'Arnold'
teacher = Teacher.new(specialization: 'History', name: 'Mr. Smith', age: 30)

# Test can_use_services? method
puts "#{person.name} can use services: #{person.can_use_services?}" # Should be true (age >= 18)
puts "#{student.name} can use services: #{student.can_use_services?}" # Should be true (parent permission)
puts "#{student_b.name} can use services: #{student_b.can_use_services?}" # Should be false (parent permission)
puts "#{teacher.name} can use services: #{teacher.can_use_services?}" # Should be true (overridden method)

# Test play_hooky? method
puts "#{student.name} play_hooky: #{student.play_hook}" # Should output "¯(ツ)/¯"

# Test the decorators
person = Person.new(name: 'maximilianus', age: 22)
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"
