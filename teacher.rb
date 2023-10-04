require_relative 'person'

# The is the teacher class, which represents teacher information
class Teacher < Person
  attr_reader :specialization

  def initialize(specialization:, name: 'Unknown', age: 0)
    super(name: name, age: age)
    @specialization = specialization
  end

  # override the can_use_services? method
  def can_use_services?
    true
  end
end
