require_relative 'person'

# The is the teacher class, which represents teacher information
class Teacher < Person
  attr_reader :specialization

  def initialize(name: 'Unknown', age: 0, specialization: 'Unknown')
    super(name: name, age: age)
    @specialization = specialization
  end

  def self.create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    return nil unless specialization.length >= 1

    print 'Age (numeric): '
    age = gets.chomp.to_i
    return nil unless age.positive?

    Teacher.new(specialization: specialization, age: age, name: name)
  end

  # override the can_use_services? method
  def can_use_services?
    true
  end
end
