require './basedecorator'

class CapitalizeDecorator < Basedecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
