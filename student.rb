require_relative 'person'

class Student < person
  def initialize(age, name = ‘Unknown’, parent_permission: true, classroom )
    super(age,name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\\_(ツ)_/¯"
  end

