require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true, nameable)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @nameable = nameable
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @nameable.correct_name
  end

  private

  def of_age?
    @age >= 18
  end

  attr_accessor :name, :age
  attr_reader :id
end
