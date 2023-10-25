require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'creation'
require_relative 'list'

class App
  include Creator
  include Lister
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def start
    loop { choose_option }
  end
end
