require_relative 'person'
attr_reader :specialization

# The is the teacher class, which represents teacher information
class Teacher < Person
  def initialize(specialization:, name: 'Unknown', age: 0)
    super(name, age)
    @specialization = specialization
  end

  # override the can_use_services? method
  def can_use_services?
    true
  end
end
