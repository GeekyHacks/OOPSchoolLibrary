require_relative 'person'

class Teacher < Person
  def initialize(name = 'Unknown', age = 0, parent_permission: true, specialization)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
