require './nameable'
require './rental'
require './book'
class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :rentals, :parent_permission

  def initialize(age, _name, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = 'name'
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
